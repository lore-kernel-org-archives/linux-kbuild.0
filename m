Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56050 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081Ab0KGHzr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Nov 2010 02:55:47 -0500
Date: Sun, 7 Nov 2010 15:58:41 +0800
From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: introduce ARCH_LIST for headers_install_all
Message-ID: <20101107075841.GM3046@hack>
References: <1288357441-23100-1-git-send-email-kirill@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1288357441-23100-1-git-send-email-kirill@shutemov.name>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Kirill A. Shutsemov" <kirill@shutemov.name>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Woodhouse <dwmw2@infradead.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 29, 2010 at 04:04:00PM +0300, Kirill A. Shutsemov wrote:
>From: Kirill A. Shutemov <kirill@shutemov.name>
>
>Using ARCH_LIST you can specify subset of architectures you want to get
>headers for.
>

The name is confusing, I think HEADER_ARCH_LIST is much better. :)

-- 
Live like a child, think like the god.
 
