Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56372 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754107AbcKKMiC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2016 07:38:02 -0500
Subject: Re: Kbuild: CC= handling broken for tools/
References: <2ef7ef23-5b11-a2cf-6205-4313aedddea8@suse.cz>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5c27c380-d6c7-ac55-d081-057023a85071@suse.com>
Date: Fri, 11 Nov 2016 13:38:00 +0100
MIME-Version: 1.0
In-Reply-To: <2ef7ef23-5b11-a2cf-6205-4313aedddea8@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>

On 2016-11-11 12:23, Jiri Slaby wrote:
> Hi,
> 
> I am trying a new gcc with new warnings enabled:
> 
> make O=../a/gcc7/ CC='gcc-7' V=1 kernel/exit.o
> EXTRA_CFLAGS='-Wimplicit-fallthrough=3'

Note that EXTRA_CFLAGS is a makefile variable read by both kbuild and
tools/build apparently.

> 
> But the build fails when building under tools/:
[...]
> gcc: error: unrecognized command line option ‘-Wimplicit-fallthrough=3’;
> did you mean ‘-Wno-fallthrough’?
> 
> 
> Apparently, CC is not respected for tools/ dir.

Jiri can better explain the behavior of the tools/ Makefiles, but if you
want to use extra flags for kernel compilation, you should be using the
KCFLAGS variable (see Documentation/kbuild/kbuild.txt).

Michal
