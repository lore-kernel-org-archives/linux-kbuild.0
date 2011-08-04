Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51311 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751765Ab1HDO0p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Aug 2011 10:26:45 -0400
Message-ID: <4E3AAC24.1080803@suse.cz>
Date: Thu, 04 Aug 2011 16:26:44 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: recordmcount.pl fails the build for ppc machines
References: <CAHpdbYGXQ-gpeyyo06AvTqhAmrOV3TbxjbJX3FR9JHPAWGsCbQ@mail.gmail.com>
In-Reply-To: <CAHpdbYGXQ-gpeyyo06AvTqhAmrOV3TbxjbJX3FR9JHPAWGsCbQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ciprian Barbu <ciprian.barbu@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 4.8.2011 15:46, Ciprian Barbu wrote:
> Hello,
>
> I encountered a problem on a ppc machine when trying to build the
> kernel modules for the LINX ipc framework. The output of make is:
>
> % make
> # ARCH=ppc
> # KERNEL=/lib/modules/2.6.32-28-powerpc/build
> # VERBOSE=no
> make[1]: Entering directory `/usr/src/linux-headers-2.6.32-28-powerpc'
>    CC [M] /home/poly/tpjb/linx-2.5.0/net/linx/af_linx.o
> Arch ppc is not supported with CONFIG_FTRACE_MCOUNT_RECORD at

That's correct, the architecture has been called "powerpc" for a long time.

Michal
