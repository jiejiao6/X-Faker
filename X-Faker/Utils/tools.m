//
//  tools.m
//  X-Faker
//
//  Created by whois on 2018/12/20.
//  Copyright © 2018年 whois. All rights reserved.
//

#import "tools.h"
#include <spawn.h>
@implementation tools

@end




extern char **environ;

void run_cmd(char *cmd)
{
    pid_t pid;
    char *argv[] = {"sh", "-c", cmd, NULL};
    int status;
    
    status = posix_spawn(&pid, "/bin/sh", NULL, NULL, argv, environ);
    if (status == 0) {
        if (waitpid(pid, &status, 0) == -1) {
            perror("waitpid");
        }
    }
}
