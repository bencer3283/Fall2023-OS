#include <task3.c>

int main() {
    JobHolding jobHolding;
    JobHolding finishedJobs;
    initJobHolding(&jobHolding, 2);
    initJobHolding(&finishedJobs, 1000);

    char id0[50] = "job0";
    char id1[50] = "job1";
    char id2[50] = "job2";
    char id3[50] = "job3";
    createJob(&jobHolding, id0, 4);
    createJob(&jobHolding, id1, 4);
    createJob(&jobHolding, id2, 4);
    createJob(&jobHolding, id3, 4);
    
    findStartJob(&jobHolding, id0);
    findStartJob(&jobHolding, id1);
    findStartJob(&jobHolding, id2);
    //findStartJob(&jobHolding, id3);
    findWaitJob(&jobHolding, id0);
    sleep(2);
    statJobs(&jobHolding, &finishedJobs);

    
    cleanJobs(&jobHolding, &finishedJobs); //clean error
    sleep(2);
    statJobs(&jobHolding, &finishedJobs);
}