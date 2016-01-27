Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:42847 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752913AbcA0MFF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Jan 2016 07:05:05 -0500
Date: Wed, 27 Jan 2016 13:03:57 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH tip v5 2/5] kbuild: Add option to turn incompatible
 pointer check into error
In-Reply-To: <1448890711-5812-3-git-send-email-daniel.wagner@bmw-carit.de>
Message-ID: <alpine.DEB.2.11.1601271300490.3886@nanos>
References: <1448890711-5812-1-git-send-email-daniel.wagner@bmw-carit.de> <1448890711-5812-3-git-send-email-daniel.wagner@bmw-carit.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Wagner <daniel.wagner@bmw-carit.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>

On Mon, 30 Nov 2015, Daniel Wagner wrote:
>  
> +ifdef CONFIG_ENABLE_ERR_TYPE_CHECK
> +KBUILD_CFLAGS += $(call cc-option,-Werror=incompatible-pointer-types)
> +endif

I don't see a value for making this configurable. If the compiler supports it,
we should use it. It already found a bug, so why would we make that optional?

Thanks,

	tglx
