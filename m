Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52033 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751994AbcEJPFz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 11:05:55 -0400
Date: Tue, 10 May 2016 17:05:55 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH v2] kbuild: forbid kernel directory to contain spaces
	and colons
Message-ID: <20160510150554.GA30705@pobox.suse.cz>
References: <1459625933-20677-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459625933-20677-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 02, 2016 at 09:38:53PM +0200, Robert Jarzmik wrote:
> When the kernel path contains a space or a colon somewhere in the path
> name, the modules_install target doesn't work anymore, as the path names
> are not enclosed in double quotes. It is also supposed that and O= build
> will suffer from the same weakness as modules_install.
> 
> Instead of checking and improving kbuild to resist to directories
> including these characters, error out early to prevent any build if the
> kernel's main directory contains a space.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: add colon check as requested by Michal.
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to kbuild.git#kbuild.

Michal
