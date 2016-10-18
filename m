Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:59276 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752675AbcJRR0I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Oct 2016 13:26:08 -0400
Subject: Re: Difficulties around "fixdep" for the usage of a kernel build
 output directory
References: <4f2251fc-94ee-41d3-cc03-a39cee5a084c@users.sourceforge.net>
 <CA+r1ZhjmaXi+Nf8vNsMwzfuSkYOByC6D_F=GkehneqfnSO7iCQ@mail.gmail.com>
 <1238ba8e-a297-6de5-2e6a-50e6e72e77d3@users.sourceforge.net>
 <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <ec3a7283-3c41-9879-49ae-8924b8daf65f@users.sourceforge.net>
Date: Tue, 18 Oct 2016 19:25:59 +0200
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhhqEBvV0ivz=MvaHhRquhFS2mxddJ-GOx81ZeSerKsD3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>

> Fine, but my point was to check that the basic things worked before
> trying the complicated, or "advanced" stuff.

Your suggestion is fine in this sense. I can observe that the following command variant
works as expected here.

my_build_dir=/tmp/fixdep-check-20161018-1 && mkdir "${my_build_dir}" && my_cc=/usr/bin/gcc-6 && make O="${my_build_dir}" HOSTCC="${my_cc}" allmodconfig && make -j6 O="${my_build_dir}" HOSTCC="${my_cc}" drivers/md/


> If, somehow, fixdep didn't work in a basic setup then you'd know it wasn't one of your
> advanced features that was causing the problem.

The command example above is an approximation for the configuration approach
which I would really want instead.


> And if fixdep did work with a basic setup , then that would suggest
> something wrong with your advanced command line.

How do you think about to clarify further which implementation detail could trigger
the shown software build difficulty?

Can it be that the passing of the adjusted parameter "HOSTCFLAGS" has got a significant
influence (with unwanted side effects) in this use case?

Regards,
Markus
