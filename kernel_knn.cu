//The distKernel computes the difference squared between two points. Requires size number of threads
// input:	2d dimentional data, input x (read only data path)
// output:	distance for each sample/row of 2d data 

// version 1: earch row/thread cacludate the difference
//				inX  is in the read-only data path
__global__ void distKernel(float *inX, float *dataSet, int row, int col, float *distance)
{
	int gid = threadIdx.x + blockIdx.x * blockDim.x;

	if (gid < rows)
	{
		float dist = 0.f;

		for(int i=0; i<col; i++)
		{
			float f = (inX[i] - dataSet[gid * col + i]) 
			dist += f * f;
		}
		distance[gid] = sqrt(dist);
	}
}
