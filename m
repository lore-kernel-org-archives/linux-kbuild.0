Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41554 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727828AbfLDPHn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 10:07:43 -0500
Date: Wed, 4 Dec 2019 16:07:30 +0100
From: David Sterba <dsterba@suse.cz>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191204150728.GD2734@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Dec 04, 2019 at 12:10:25PM +0900, Masahiro Yamada wrote:
> On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> > +awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|desc|depends)/'
> 
> I want to see a good reason (e.g. useful for other developers) for upstreaming.
> This script looks like your custom script, which you can maintain locally.

I think the verbosity should be added to either lsmod or modinfo, not
some script in kernel git.
