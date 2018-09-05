Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:55511 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726335AbeIEV1D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 17:27:03 -0400
Date: Wed, 5 Sep 2018 18:55:52 +0200
From: Greg KH <greg@kroah.com>
Subject: Re: [RFC] UAPI: Check headers by compiling all together as C++
Message-ID: <20180905165552.GB25206@kroah.com>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-nilfs@vger.kernel.org, linux-nvdimm@lists.01.org, "Michael S. Tsirkin" <mst@redhat.com>, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu, coreteam@netfilter.org, Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Takashi Iwai <tiwai@suse.com>, linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>, Jaroslav Kysela <perex@perex.cz>, Jan Harkes <jaharkes@cs.cmu.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>, Jason Wang <jasowang@redhat.com>, Mat Martineau <mathew.j.martineau@linux.intel.com>, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, moderated for non-subscribers <alsa-devel@alsa-project.org>, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Wed, Sep 05, 2018 at 04:54:27PM +0100, David Howells wrote:
> 
> Here's a set of patches that inserts a step into the build process to make
> sure that the UAPI headers can all be built together with C++ (if the
> compiler being used supports C++).  All but the final patch perform fixups,
> including:

Wait, why do we care?  What has recently changed to start to directly
import kernel uapi files into C++ code?

And if userspace wants to do this, can't they do the C namespace trick
themselves when they do the import?  That must be how they are doing it
today, right?

thanks,

greg k-h
