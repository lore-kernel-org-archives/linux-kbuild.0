Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44625 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750879AbdACKgJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jan 2017 05:36:09 -0500
Subject: Re: Ambiguity in Documentation/kbuild/modules.txt
References: <40236E75-937E-4368-B694-BA5E80647251@redfish-solutions.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <035a4e49-ad6d-7bd7-4eff-632e78f25b10@suse.com>
Date: Tue, 3 Jan 2017 11:36:06 +0100
MIME-Version: 1.0
In-Reply-To: <40236E75-937E-4368-B694-BA5E80647251@redfish-solutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: mfm@muteddisk.com, pjday@mindspring.com, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On 2016-12-22 20:32, Philip Prindeville wrote:
> but what if we were dealing with someone who had written a 2.4 Makefile, and had named the files:
> 
> 	8123.c                  <= problematic name
> 	8123_if.c
> 	8123_if.h
> 	8123_pci.c
> 	8123_bin.o_shipped
> 
> instead?
> 
> It seems to me that the line:
> 
> 8123-y := 8123.o 8123_if.o 8123_pci.o 8123_bin.o
> 
> would be problematic (i.e. a circular dependency). Yes, the person
> who
> developed the software I’m trying to Build should probably have named
> 8123.c as “8123_main.c” instead, but he didn’t... though arguably it’s
> an unnecessary restriction to not have a source file called
> $(module_name).c in the list of sources for $(module_name).ko ...
> 
> So how does one work around this issue? A possible fix to the Kbuild
> machinery itself would involve linking the $(8123-y) object files into
> 8123_.o instead, and then using that to derive 8123.ko ...

Hi Philip,

scripts/Makefile.build is quite complex already, so I suggest to work
around this by renaming the source file.

Michal
