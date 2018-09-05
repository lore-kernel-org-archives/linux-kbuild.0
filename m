Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from a3.inai.de ([88.198.85.195]:36498 "EHLO a3.inai.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727267AbeIFABq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 20:01:46 -0400
Date: Wed, 5 Sep 2018 21:22:11 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [RFC] UAPI: Check headers by compiling all together as C++
In-Reply-To: <20180905165552.GB25206@kroah.com>
Message-ID: <nycvar.YFH.7.76.1809052120510.24932@n3.vanv.qr>
References: <153616286704.23468.584491117180383924.stgit@warthog.procyon.org.uk> <20180905165552.GB25206@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: David Howells <dhowells@redhat.com>, linux-api@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-nilfs@vger.kernel.org, linux-nvdimm@lists.01.org, "Michael S. Tsirkin" <mst@redhat.com>, codalist@coda.cs.cmu.edu, coda@cs.cmu.edu, coreteam@netfilter.org, Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Takashi Iwai <tiwai@suse.com>, linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>, Jaroslav Kysela <perex@perex.cz>, Jan Harkes <jaharkes@cs.cmu.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>, Jason Wang <jasowang@redhat.com>, Mat Martineau <mathew.j.martineau@linux.intel.com>, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, moderated for non-subscribers <alsa-devel@alsa-project.org>, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Wednesday 2018-09-05 18:55, Greg KH wrote:

>On Wed, Sep 05, 2018 at 04:54:27PM +0100, David Howells wrote:
>> 
>> Here's a set of patches that inserts a step into the build process to make
>> sure that the UAPI headers can all be built together with C++ (if the
>> compiler being used supports C++).  All but the final patch perform fixups,
>> including:
>
>Wait, why do we care?  What has recently changed to start to directly
>import kernel uapi files into C++ code?

With C++11, C++ has become a much nicer language to use (for userspace, anyway).

>And if userspace wants to do this, can't they do the C namespace trick
>themselves when they do the import?

The only trick is to use an extra C source file and extensively wrap things.
