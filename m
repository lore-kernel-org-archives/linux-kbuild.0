Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:36505 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932586Ab2GKNqW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Jul 2012 09:46:22 -0400
Date: Wed, 11 Jul 2012 13:46:21 +0000
From: maximilian attems <maks@stro.at>
Subject: Re: 'make deb-pkg' generates a linux-headers-(version) that skips
 some files
Message-ID: <20120711134621.GT28778@vostochny.stro.at>
References: <CAPZXPQfE7M0Jzsns4zKrKu0x55_AWEUpzydm1dUOshhZo_ki=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPZXPQfE7M0Jzsns4zKrKu0x55_AWEUpzydm1dUOshhZo_ki=A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?Martin-=C9ric?= Racine <martin-eric.racine@iki.fi>
Cc: linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org

On Wed, Jul 11, 2012 at 04:14:08PM +0300, Martin-Éric Racine wrote:
> 
> Compilation of the standalone modules failed, because the
> linux-headers package produced by 'make deb-pkg' failed to include
> (arch/x86/Makefile_32.cpu), which had to be copied by hand to complete
> the build.
> 

It is already fixed in linux-next.

Best,

-- 
maks
