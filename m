Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33984 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757988Ab0JFNpp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Oct 2010 09:45:45 -0400
Date: Wed, 6 Oct 2010 17:45:39 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH] power: makefile cleanup
Message-ID: <20101006134539.GA16839@oksana.dev.rtsoft.ru>
References: <1286351187-24245-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1286351187-24245-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfm@muteddisk.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 06, 2010 at 12:46:27AM -0700, matt mooney wrote:
> Replace EXTRA_CFLAGS with ccflags-y; remove if-statements and replace
> with lists using the kbuild idiom.
> 
> None of the dependencies are modified.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---

Applied, thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
