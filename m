Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:59156 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757302Ab3D2W5t convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 18:57:49 -0400
Received: by mail-qc0-f177.google.com with SMTP id u28so3366396qcs.8
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Apr 2013 15:57:47 -0700 (PDT)
Date: Mon, 29 Apr 2013 17:57:43 -0500
From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH 1/1] kconfig: fix lists definition for C++
References: <cover.1367258255.git.yann.morin.1998@free.fr>
	<21ca352b71ca252e1933b1538fe89da8a04395c3.1367258255.git.yann.morin.1998@free.fr>
	<517EC9C7.9000903@infradead.org> <1367272454.18069.191@driftwood>
	<20130429223054.GB31039@free.fr>
In-Reply-To: <20130429223054.GB31039@free.fr> (from yann.morin.1998@free.fr
	on Mon Apr 29 17:30:54 2013)
Message-Id: <1367276263.18069.193@driftwood>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Benjamin Poirier <bpoirier@suse.de>

On 04/29/2013 05:30:54 PM, Yann E. MORIN wrote:
> Rob, All,
> 
> On Mon, Apr 29, 2013 at 04:54:14PM -0500, Rob Landley wrote:
> > On 04/29/2013 02:28:07 PM, Randy Dunlap wrote:
> > >On 04/29/13 10:59, Yann E. MORIN wrote:
> > >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > >>
> > >> The C++ compiler is more strict in that it refuses to assign
> > >> a void* to a struct list_head*.
> >
> > Given that the code _isn't_ C++ (because C is not a subset of C++  
> but a
> > separate langauge in its own right where "throw" is a legitimate  
> variable
> > name and so on), how is this an issue?
> 
> It's an issue because the xconfig frontends is qconf, which as the  
> name
> implies is using Qt, which *is* C++, and includes list.h.
> 
> So, list.h is included by both by C and C++ code.
> 
> So yes, list.h can be compiled by a C++ compiler.
> 
> Now, granted: list.h should all be enclosed in:
>     ifdef __cpluplus
>     extern "C" {
>     endif
>     ...
>     ifdef __cpluplus
>     }
>     endif
> 
> Was that the fix you were suggesting between the lines? ;-)

It does more clearly document the issue. (A comment about the QT  
front-end would also be nice. I don't use that one, so I didn't think  
of it.)

Thanks,

Rob