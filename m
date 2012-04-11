Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:59955 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933969Ab2DKX6W (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 Apr 2012 19:58:22 -0400
Date: Wed, 11 Apr 2012 19:54:44 -0400 (EDT)
Message-Id: <20120411.195444.540814653660043985.davem@davemloft.net>
Subject: Re: [PATCH 3/5] drivers/net: remove IS_ENABLED usage from wiznet
 drivers
From: David Miller <davem@davemloft.net>
In-Reply-To: <1334188257-3449-4-git-send-email-paul.gortmaker@windriver.com>
References: <1334188257-3449-1-git-send-email-paul.gortmaker@windriver.com>
	<1334188257-3449-4-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: paul.gortmaker@windriver.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, tony@bakeyournoodle.com, mmarek@suse.cz, lacombar@gmail.com

From: Paul Gortmaker <paul.gortmaker@windriver.com>
Date: Wed, 11 Apr 2012 19:50:55 -0400

> The use of IS_ENABLED in C code (vs just in CPP #if directives)
> causes us to carry the burden of a huge autoconf.h file.  It is
> also misleading in that a casual inspection of the code would
> leave one thinking that the if statements were evaluated at
> runtime, when TX_FLOW is a Kconfig bool and hence evaluated
> at configure time as an either/or.
> 
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Want me to toss this into net-next?
