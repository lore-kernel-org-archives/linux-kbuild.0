Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42506 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfCMLGW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 07:06:22 -0400
Subject: Re: [PATCH 3/3] kvm: don't redefine flags as something else
References: <20181017170554.18841-1-bigeasy@linutronix.de>
 <20181017170554.18841-4-bigeasy@linutronix.de>
 <4270a987-e88f-11d6-fb27-c2f79009e0f1@redhat.com>
 <20190313085838.4asltgdydrznnkxv@linutronix.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8f8e4bc6-e4e2-b709-1ee1-53ee58c5cca0@redhat.com>
Date: Wed, 13 Mar 2019 12:06:17 +0100
MIME-Version: 1.0
In-Reply-To: <20190313085838.4asltgdydrznnkxv@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, linux-kbuild@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org

On 13/03/19 09:58, Sebastian Andrzej Siewior wrote:
> On 2018-10-17 19:06:33 [+0200], Paolo Bonzini wrote:
>> On 17/10/2018 19:05, Sebastian Andrzej Siewior wrote:
>>> The function irqfd_wakeup() has flags defined as __poll_t and then it
>>> has additional flags which is used for irqflags.
>>>
>>> Redefine the inner flags variable as iflags so it does not shadow the
>>> outer flags.
>>>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: "Radim Krčmář" <rkrcmar@redhat.com>
>>> Cc: kvm@vger.kernel.org
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> this touches only kvm and was acked by a kvm person. What did it miss to
> get applied? :)

I was expecting it to be applied together with the other patches.  I can
queue it too.

Paolo
