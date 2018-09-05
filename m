Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53584 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726497AbeIEWOT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 18:14:19 -0400
Date: Wed, 5 Sep 2018 13:42:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC] UAPI: Check headers by compiling all together as C++
Message-ID: <20180905133711-mutt-send-email-mst@kernel.org>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
 <20180905165552.GB25206@kroah.com>
 <a1efae8d26cc5b73b180e9521d6b62590c55aa86.camel@opteya.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1efae8d26cc5b73b180e9521d6b62590c55aa86.camel@opteya.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yann Droneaud <ydroneaud@opteya.com>
Cc: Greg KH <greg@kroah.com>, David Howells <dhowells@redhat.com>, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-nilfs@vger.kernel.org, linux-nvdimm@lists.01.org, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu, coreteam@netfilter.org, Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Takashi Iwai <tiwai@suse.com>, linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>, Jaroslav Kysela <perex@perex.cz>, Jan Harkes <jaharkes@cs.cmu.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>, Jason Wang <jasowang@redhat.com>, Mat Martineau <mathew.j.martineau@linux.intel.com>, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, moderated for non-subscribers <alsa-devel@alsa-project.org>, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Wed, Sep 05, 2018 at 07:33:38PM +0200, Yann Droneaud wrote:
> Hi,
> 
> Le mercredi 05 septembre 2018 à 18:55 +0200, Greg KH a écrit :
> > On Wed, Sep 05, 2018 at 04:54:27PM +0100, David Howells wrote:
> > > 
> > > Here's a set of patches that inserts a step into the build process to make
> > > sure that the UAPI headers can all be built together with C++ (if the
> > > compiler being used supports C++).  All but the final patch perform fixups,
> > > including:
> > 
> > Wait, why do we care?  What has recently changed to start to directly
> > import kernel uapi files into C++ code?
> > 
> > And if userspace wants to do this, can't they do the C namespace trick
> > themselves when they do the import?  That must be how they are doing it
> > today, right?
> > 
> 
> They can't.
> 
> 
> Adding extern "C" { } doesn't magically make "class" a non keyword.
> Even if it was the case, writing C++ code using whatever->class would
> probably broke because class is a keyword in C++.

I think it's a bug in the language TBH.

> -- 
> Yann Droneaud
> OPTEYA
> 
