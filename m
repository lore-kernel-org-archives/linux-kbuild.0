Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:56395 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751929Ab1KNAta (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Nov 2011 19:49:30 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH V2 2/2] module: Fix performance regression on modules with large symbol tables
In-Reply-To: <e80b536093214489c32ce319b54b0f80@localhost>
References: <73defb5e4bca04a6431392cc341112b1@localhost> <e80b536093214489c32ce319b54b0f80@localhost>
Date: Mon, 14 Nov 2011 11:05:14 +1030
Message-ID: <87obwfpmm5.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Jan Beulich <JBeulich@novell.com>

On Sat, 12 Nov 2011 19:08:56 -0800, Kevin Cernekee <cernekee@gmail.com> wrote:
> +			/*
> +			 * Copy the symbol name to mod->core_strtab.
> +			 * "name" might point to the middle of a longer strtab
> +			 * entry, so backtrack to the first "required" byte
> +			 * of the string.
> +			 */

Icky, but it works.

Both applied, thanks!
Rusty.
