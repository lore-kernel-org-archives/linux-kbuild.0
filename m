Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from web95116.mail.in2.yahoo.com ([203.104.18.168]:40651 "HELO
	web95116.mail.in2.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751823AbYBKHbu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 02:31:50 -0500
Date: Mon, 11 Feb 2008 07:25:06 +0000 (GMT)
From: murtuja bharmal <murtuja_bharmal@yahoo.com>
Subject: help required for KBUILD
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Message-ID: <193302.60802.qm@web95116.mail.in2.yahoo.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Sudo Code for kernel module compilation using KBUILD
SYSTEM. 

If module versioing is enabled. 

step1. 

create a .tmp_<moudule name>.o file from <module
name>.c using gcc. 

step2. 

if objdump -h .tmp_<module name>.o | grep -q
__ksymtab; then 

gcc -D GENKSYMS
..............|scripts/genksyms/genksyms >
.tmp_<module name>.ver 

ld -m elf_i386 -r -o <module name>.o .tmp_<module
name>.o .tmp_<module name>.ver 

else 

mv -f .tmp_<module name>.o <module name>.o 

Step 3. 

LINUXDIR/scripts/mod/modpost .............. vmlinux
<module name>.o 

#the above command create file <module name>.mod.c 

Step 4. 

gcc ....................... - o <module name>.mod.o
<module name>.mod.c 

Step 5. 

ld -m elf_i386 -r -o <module name>.ko <module name>.o
<module name>.mod.o 



In step 2 it is checking for 
__ksymtab on .tmp_<module name>.o header.

Can anybody tell me when __ksymtab in included in
module object header.
Is it only added when we have EXPORT_SYMBOL Macro in
kernel module code or any other reason.
And what is .tmp_<module name>.ver file.






      Chat on a cool, new interface. No download required. Go to http://in.messenger.yahoo.com/webmessengerpromo.php
