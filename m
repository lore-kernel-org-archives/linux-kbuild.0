Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.bmw-carit.de ([62.245.222.98]:56520 "EHLO
	mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753990AbbK3PcF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Nov 2015 10:32:05 -0500
Subject: Re: [PATCH tip v5 2/5] kbuild: Add option to turn incompatible
 pointer check into error
References: <1448890711-5812-1-git-send-email-daniel.wagner@bmw-carit.de>
 <1448890711-5812-3-git-send-email-daniel.wagner@bmw-carit.de>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <565C6A8B.8080103@bmw-carit.de>
Date: Mon, 30 Nov 2015 16:26:03 +0100
MIME-Version: 1.0
In-Reply-To: <1448890711-5812-3-git-send-email-daniel.wagner@bmw-carit.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>

On 11/30/2015 02:38 PM, Daniel Wagner wrote:
> With the introduction of the simple wait API we have two very
> similar APIs in the kernel. For example wake_up() and swake_up()
> is only one character away. Although the compiler will warn
> happily the wrong usage it keeps on going an even links the kernel.
> Thomas and Peter would rather like to see early missuses reported
> as error early on.
> 
> In a first attempt we tried to wrap all swait and wait calls
> into a macro which has an compile time type assertion. The result
> was pretty ugly and wasn't able to catch all wrong usages.
> woken_wake_function(), autoremove_wake_function() and wake_bit_function()
> are assigned as function pointers. Wrapping them with a macro around is
> not possible. Prefixing them with '_' was also not a real option
> because there some users in the kernel which do use them as well.
> All in all this attempt looked to intrusive and too ugly.
> 
> An alternative is to turn the pointer type check into an error which
> catches wrong type uses. Obviously not only the swait/wait ones. That
> isn't a bad thing either. Though for the beginning let's introduce it
> as options in the kernel hacking section.

The kbuild bot found one problem for allmodconfig. I just send a fix for
it ("regmap: Fix leftover from struct reg_default to struct reg_sequence
change").
