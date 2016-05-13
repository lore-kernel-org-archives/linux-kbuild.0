Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143]:25164 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752216AbcEMBtm convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 May 2016 21:49:42 -0400
Date: Fri, 13 May 2016 09:49:06 +0800
From: Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH] deb-pkg: add the shared header file for arm64
Message-ID: <20160513014905.GA15321@sha-win-210.asiapac.arm.com>
References: <1463043837-4348-1-git-send-email-shijie.huang@arm.com>
 <573491A2.7070809@suse.com>
MIME-Version: 1.0
In-Reply-To: <573491A2.7070809@suse.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: nd@arm.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steve.capper@arm.com

On Thu, May 12, 2016 at 04:22:26PM +0200, Michal Marek wrote:
> On 2016-05-12 11:03, Huang Shijie wrote:
> > The arch/arm/include/asm/opcodes.h is also used by the arm64.
> > This patch copies it to the arm64 deb package.
> > 
> > Signed-off-by: Huang Shijie <shijie.huang@arm.com>
> > ---
> >  scripts/package/builddeb | 6 ++++++
> >  1 file changed, 6 insertions(+)
> 
> 
> Hi Huang,
> 
> this is fixed (admittedly in a more aggressive way) by 962475ac2f96
> ("builddeb: fix missing headers in linux-headers package") in linux-next.
okay. got it.

thanks
Huang Shijie

