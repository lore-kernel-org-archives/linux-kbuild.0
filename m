Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:50384 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755573AbcJRNzT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2016 09:55:19 -0400
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Difficulties around "fixdep" for the usage of a kernel build output
 directory
Message-ID: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
Date: Tue, 18 Oct 2016 15:54:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org

Hello,

The file "README" contains a section "BUILD directory for the kernel".
I would like to use the functionality which is described there.

One of my commands for such a build try is working as desired.


elfring@Sonne:~/Projekte/Linux/next-patched> git checkout next-20161014 && my_off=-O0 && for X in off; do my_output_dir=${my_build_dir}unchanged/optimisation/${X} && my_var="my_${X}" && my_parameters="-Wall -std=gnu89 -fomit-frame-pointer ${!my_var}" && make O="${my_output_dir}" HOSTCC='/usr/bin/gcc-6' HOSTCFLAGS="${my_parameters}" allmodconfig; done
…
#
# configuration written to .config
#


I stumble on the following messages for another build command.


elfring@Sonne:~/Projekte/Linux/next-patched> my_off=-O0 && for X in off; do my_output_dir=${my_build_dir}unchanged/optimisation/${X} && my_var="my_${X}" && my_parameters="-Wall -std=gnu89 -fomit-frame-pointer ${!my_var}" && LANG=C make V=2 O="${my_output_dir}" HOSTCC='/usr/bin/gcc-6' HOSTCFLAGS="-S ${my_parameters}" drivers/md/; done
make[1]: Entering directory …
  HOSTCC  scripts/basic/fixdep - due to command line change
scripts/basic/fixdep: line 1: .file: command not found
scripts/basic/fixdep: line 2: .comm: command not found
…
scripts/basic/fixdep: line 6: .section: command not found
scripts/basic/fixdep: line 7: .align: command not found
scripts/basic/fixdep: line 8: .LC0:: command not found
scripts/basic/fixdep: line 9: .string: command not found
…


I wonder why this approach does not work so far.
I would appreciate your advices.

Regards,
Markus
