Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:46615 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfCMI6l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 04:58:41 -0400
Date: Wed, 13 Mar 2019 09:58:38 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 3/3] kvm: don't redefine flags as something else
Message-ID: <20190313085838.4asltgdydrznnkxv@linutronix.de>
References: <20181017170554.18841-1-bigeasy@linutronix.de>
 <20181017170554.18841-4-bigeasy@linutronix.de>
 <4270a987-e88f-11d6-fb27-c2f79009e0f1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <4270a987-e88f-11d6-fb27-c2f79009e0f1@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de, linux-kbuild@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org

On 2018-10-17 19:06:33 [+0200], Paolo Bonzini wrote:
> On 17/10/2018 19:05, Sebastian Andrzej Siewior wrote:
> > The function irqfd_wakeup() has flags defined as __poll_t and then it
> > has additional flags which is used for irqflags.
> > 
> > Redefine the inner flags variable as iflags so it does not shadow the
> > outer flags.
> > 
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: "Radim Krčmář" <rkrcmar@redhat.com>
> > Cc: kvm@vger.kernel.org
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

this touches only kvm and was acked by a kvm person. What did it miss to
get applied? :)

Sebastian
