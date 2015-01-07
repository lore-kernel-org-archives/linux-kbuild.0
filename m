Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39424 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751418AbbAGKeb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2015 05:34:31 -0500
Date: Wed, 7 Jan 2015 21:34:28 +1100
From: Anton Blanchard <anton@samba.org>
Subject: Re: [PATCH 1/2] jump_label: Allow jump labels to be used in
 assembly
Message-ID: <20150107213428.5ddb2095@kryten>
In-Reply-To: <20150106174822.GA29629@home.goodmis.org>
References: <1420539628-17875-1-git-send-email-anton@samba.org>
	<20150106174822.GA29629@home.goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, peterz@infradead.org, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Steve,

> Have you tested this on other archs? Because just looking at x86, it
> doesn't seem that asm/jump_label.h can handle being called in
> assembly.

Since no one is including linux/jump_label.h in assembly yet, nothing
should break. We could however add __ASSEMBLY__ protection to all the
asm/jump_label.h files. Patches on the way.

Anton
