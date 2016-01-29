Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.bmw-carit.de ([62.245.222.98]:40694 "EHLO
	mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755978AbcA2MYI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Jan 2016 07:24:08 -0500
Subject: Re: [PATCH tip v6 2/5] kbuild: Add option to turn incompatible
 pointer check into error
References: <1453992270-4688-1-git-send-email-daniel.wagner@bmw-carit.de>
 <1453992270-4688-3-git-send-email-daniel.wagner@bmw-carit.de>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56AB5867.6020405@bmw-carit.de>
Date: Fri, 29 Jan 2016 13:17:43 +0100
MIME-Version: 1.0
In-Reply-To: <1453992270-4688-3-git-send-email-daniel.wagner@bmw-carit.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>

On 01/28/2016 03:44 PM, Daniel Wagner wrote:
> +# enforce correct pointer usage
> +KBUILD_CFLAGS += $(call cc-option,-Werror=incompatible-pointer-types)
> +

As it turns out there are a few fallouts by that one. I'll send fixes
for it.
