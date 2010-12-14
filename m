Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:52830 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752111Ab0LNWO1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Dec 2010 17:14:27 -0500
Date: Tue, 14 Dec 2010 23:04:25 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH, RESEND 1/2] kbuild: introduce HDR_ARCH_LIST for
	headers_install_all
Message-ID: <20101214220425.GA8831@pobox.suse.cz>
References: <1292260229-10008-1-git-send-email-kirill@shutemov.name> <1292260229-10008-2-git-send-email-kirill@shutemov.name> <1292260229-10008-1-git-send-email-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1292260229-10008-2-git-send-email-kirill@shutemov.name> <1292260229-10008-1-git-send-email-kirill@shutemov.name>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Kirill A. Shutsemov" <kirill@shutemov.name>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Woodhouse <dwmw2@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>

On Mon, Dec 13, 2010 at 07:10:28PM +0200, Kirill A. Shutsemov wrote:
> From: Kirill A. Shutemov <kirill@shutemov.name>
> 
> Using HDR_ARCH_LIST you can specify subset of architectures you want to get
> headers for.

On Mon, Dec 13, 2010 at 07:10:29PM +0200, Kirill A. Shutsemov wrote:
> From: Kirill A. Shutemov <kirill@shutemov.name>
> 
> Export linux/a.out.h, linux/kvm.h and linux/kvm_para.h on
> headers_install_all if at least one architecture has appropriate files
> in arch-dependent headers.
> 
> Signed-off-by: Kirill A. Shutemov <kirill@shutemov.name>

Thanks, applied both patches to kbuild-2.6.git#kbuild.

Michal
