Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:34182 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751837AbaGMVSi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Jul 2014 17:18:38 -0400
Date: Sun, 13 Jul 2014 23:18:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCHv1 1/2] Documentation: headers_install.txt is part of
 kbuild
Message-ID: <20140713211819.GA16496@ravnborg.org>
References: <20140709204915.GB32335@ravnborg.org>
 <cover.1405246007.git.ydroneaud@opteya.com>
 <bba4e1dd32c0e30b70443d70ff79187683fed9b3.1405246009.git.ydroneaud@opteya.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bba4e1dd32c0e30b70443d70ff79187683fed9b3.1405246009.git.ydroneaud@opteya.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Yann Droneaud <ydroneaud@opteya.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>, Michal Marek <mmarek@suse.cz>, David Woodhouse <dwmw2@infradead.org>, Rob Landley <rob@landley.net>

On Sun, Jul 13, 2014 at 12:15:29PM +0200, Yann Droneaud wrote:
> 'headers_install.txt' from Documentation/make/ is related to Kbuild
> so it must be moved in Documentation/kbuild/ directory.
> 
> As Documentation/make/ directory has only one file, it will be removed
> as a consequence of moving 'headers_install.txt'.
> 
> Cc: Kirill A. Shutemov <kirill@shutemov.name>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Rob Landley <rob@landley.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>

This is much better - thanks.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/kbuild/00-INDEX                      | 2 ++
>  Documentation/{make => kbuild}/headers_install.txt | 0
>  2 files changed, 2 insertions(+)
>  rename Documentation/{make => kbuild}/headers_install.txt (100%)
