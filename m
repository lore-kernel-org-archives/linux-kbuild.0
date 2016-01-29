Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.bmw-carit.de ([62.245.222.98]:40693 "EHLO
	mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755945AbcA2MYG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 29 Jan 2016 07:24:06 -0500
Subject: Re: [PATCH tip v6 3/5] KVM: use simple waitqueue for vcpu->wq
References: <1453992270-4688-1-git-send-email-daniel.wagner@bmw-carit.de>
 <1453992270-4688-4-git-send-email-daniel.wagner@bmw-carit.de>
From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Message-ID: <56AB5899.5020503@bmw-carit.de>
Date: Fri, 29 Jan 2016 13:18:33 +0100
MIME-Version: 1.0
In-Reply-To: <1453992270-4688-4-git-send-email-daniel.wagner@bmw-carit.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun.feng@gmail.com>

I missed one to fixup for ARM. I'll send an update.
