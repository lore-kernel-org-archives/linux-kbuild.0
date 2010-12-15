Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:1182 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754399Ab0LOOqJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 09:46:09 -0500
Date: Wed, 15 Dec 2010 15:46:07 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: add numeric --set-val option to scripts/config
Message-ID: <20101215144607.GA21436@pobox.suse.cz>
References: <1292398620-13197-1-git-send-email-jonas.aberg@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1292398620-13197-1-git-send-email-jonas.aberg@stericsson.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonas Aaberg <jonas.aberg@stericsson.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Dec 15, 2010 at 08:37:00AM +0100, Jonas Aaberg wrote:
> Add new option to scripts/config for changing .config numeric values
> 
> Acked-by: Linus Walleij <linus.walleij@stericsson.com>
> Signed-off-by: Jonas Aaberg <jonas.aberg@stericsson.com>
> ---
>  scripts/config |   11 +++++++++--
>  1 files changed, 9 insertions(+), 2 deletions(-)

Thanks, applied to kbuild-2.6.git#misc.

Michal
