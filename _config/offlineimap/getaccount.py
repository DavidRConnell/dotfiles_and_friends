
#! /usr/bin/python2

from subprocess import check_output

def get_pass(account):
    return get_parts(account)[0]

def get_user(account):
    return get_parts(account)[1]

def get_parts(account):
    return check_output("pass email/" + account + ".com", shell=True).splitlines()
