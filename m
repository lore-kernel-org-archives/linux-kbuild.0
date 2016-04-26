Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60923 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751060AbcDZKzm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2016 06:55:42 -0400
Date: Tue, 26 Apr 2016 07:55:33 -0300
From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: [PATCH v2 0/2] moves samples out of Documentation directory
Message-ID: <20160426075533.71a11ede@recife.lan>
In-Reply-To: <571F42DA.60005@cisco.com>
References: <1461600189-2207716-1-git-send-email-arnd@arndb.de>
	<20160426035939.51649686@lwn.net>
	<571F42DA.60005@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Hans Verkuil <hansverk@cisco.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Hans Verkuil <hans.verkuil@cisco.com>

Em Tue, 26 Apr 2016 12:28:42 +0200
Hans Verkuil <hansverk@cisco.com> escreveu:

> On 04/26/2016 11:59 AM, Jonathan Corbet wrote:
> > On Mon, 25 Apr 2016 18:03:07 +0200
> > Arnd Bergmann <arnd@arndb.de> wrote:
> >   
> >> As suggested by Nicolas Pitre, here is a resend of two patches to
> >> move the kernel modules from Documentation/*/ to samples/*/.
> >>
> >> With Nico's changes in place, it's no longer necessary to do this,
> >> but it seems like a good idea anyway for consistency.
> >> Not sure who would be the best person to pick up the patches, I'd
> >> probably either the Documentation or the kbuild maintainers.
> >>
> >> 	Arnd
> >>
> >> [PATCH v2 1/2] samples: connector: from Documentation to samples
> >> [PATCH v2 2/2] samples: v4l: from Documentation to samples directory  
> > 
> > I can take them through the docs tree.
> > 
> > Hans [added], are you OK with moving v4l2-pci-skeleton.c over to
> > the samples directory?  
> 
> Yes, that's fine. For the record:
> 
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Acked-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> 
> Regards,
> 
> 	Hans
> --
> To unsubscribe from this list: send the line "unsubscribe linux-doc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Thanks,
Mauro
