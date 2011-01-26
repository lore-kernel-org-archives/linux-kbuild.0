Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:44748 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751847Ab1AZJwE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 26 Jan 2011 04:52:04 -0500
Date: Wed, 26 Jan 2011 10:52:01 +0100
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] deb-pkg: Fix building outside of source tree (O=...).
Message-ID: <20110126095200.GK5982@stro.at>
References: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1295876501-805-1-git-send-email-nicolas.2p.debian@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas de =?iso-8859-1?Q?Peslo=FCan?= <nicolas.2p.debian@free.fr>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Mon, 24 Jan 2011, Nicolas de Pesloüan wrote:

> When building linux-headers package using deb-pkg, builddeb erroneously assume
> current directory is the source tree. This is not true if building in another
> directory, using make O=... deb-pkg.
> 
> This patch fix this problem.
> 
> Signed-off-by: Nicolas de Pesloüan <nicolas.2p.debian@free.fr>

Acked-by: maximilian attems <max@stro.at>
