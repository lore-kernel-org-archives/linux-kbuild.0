Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:34303 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933676Ab2DLAFO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Apr 2012 20:05:14 -0400
Date: Wed, 11 Apr 2012 17:05:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/5] Revert
 "mm: replace PAGE_MIGRATION with IS_ENABLED(CONFIG_MIGRATION)"
Message-Id: <20120411170502.b80f1fc0.akpm@linux-foundation.org>
In-Reply-To: <1334188257-3449-2-git-send-email-paul.gortmaker@windriver.com>
References: <1334188257-3449-1-git-send-email-paul.gortmaker@windriver.com>
	<1334188257-3449-2-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, davem@davemloft.net, tony@bakeyournoodle.com, mmarek@suse.cz, lacombar@gmail.com

On Wed, 11 Apr 2012 19:50:53 -0400
Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> This reverts commit ce1744f4ed20ca873360e54502f8a71564ef7cc6.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

Please include it in linux-next and merge it up thyself.
