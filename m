Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:34677 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752084Ab0GNOz7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Jul 2010 10:55:59 -0400
Message-ID: <4C3DCFB3.1090801@zytor.com>
Date: Wed, 14 Jul 2010 07:54:43 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] [RFC] implement size_append in perl
References: <1279116063-4499-1-git-send-email-virtuoso@slind.org>
In-Reply-To: <1279116063-4499-1-git-send-email-virtuoso@slind.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Shishkin <virtuoso@slind.org>
Cc: linux-kbuild@vger.kernel.org, =?UTF-8?B?U2ViYXN0aWFuIERhbGZ1w58=?= <sd@sedf.de>, Oliver Hartkopp <oliver@hartkopp.net>, Michael Guntsche <mike@it-loops.com>, Jonathan Nieder <jrnieder@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>, Alek Du <alek.du@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Russell King <rmk@arm.linux.org.uk>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, linux-kernel@vger.kernel.org

On 07/14/2010 07:01 AM, Alexander Shishkin wrote:
> +size_append = $(PERL) -e 'print pack("V", (stat "$(lastword $1)")[7])'

Why the "lastword"?

	-hpa
