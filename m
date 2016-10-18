Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:57476 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938478AbcJRQis (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2016 12:38:48 -0400
Subject: Re: Difficulties around "fixdep" for the usage of a kernel build
 output directory
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
Date: Tue, 18 Oct 2016 18:38:22 +0200
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>

>> elfring@Sonne:~/Projekte/Linux/next-patched> my_off=-O0 && for X in off; do my_output_dir=${my_build_dir}unchanged/optimisation/${X} && my_var="my_${X}" && my_parameters="-Wall -std=gnu89 -fomit-frame-pointer ${!my_var}" && LANG=C make V=2 O="${my_output_dir}" HOSTCC='/usr/bin/gcc-6' HOSTCFLAGS="-S ${my_parameters}" drivers/md/; done
…
> That's a very complicated command line.

I find it "advanced".

It shows a few of my imaginations around a specific software development task.


> Does something basic, like
> 
> make O=/tmp/$$ allmodconfig
> make O=/tmp/$$
> 
> work for you?

Not really. - I would like to achieve the automatic selection of a few
compilation settings by a for loop which I reduced in the shown example
to one element.

I am looking for a "convenient" way to get assembler source files from
the preferrred C compiler for some software build configurations.
I hope that I can avoid the switching of compilation results in the source
file directory hierarchy so that an occasional disassembly by a tool
like "objdump" could be compared.

Regards,
Markus
