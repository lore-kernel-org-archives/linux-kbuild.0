Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52894 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbeJRBDO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 21:03:14 -0400
Subject: Re: [PATCH 3/3] kvm: don't redefine flags as something else
References: <20181017170554.18841-1-bigeasy@linutronix.de>
 <20181017170554.18841-4-bigeasy@linutronix.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4270a987-e88f-11d6-fb27-c2f79009e0f1@redhat.com>
Date: Wed, 17 Oct 2018 19:06:33 +0200
MIME-Version: 1.0
In-Reply-To: <20181017170554.18841-4-bigeasy@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, linux-kbuild@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, kvm@vger.kernel.org

On 17/10/2018 19:05, Sebastian Andrzej Siewior wrote:
> The function irqfd_wakeup() has flags defined as __poll_t and then it
> has additional flags which is used for irqflags.
> 
> Redefine the inner flags variable as iflags so it does not shadow the
> outer flags.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Radim Krčmář" <rkrcmar@redhat.com>
> Cc: kvm@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  virt/kvm/eventfd.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
> index b20b751286fc6..d15a51622d53e 100644
> --- a/virt/kvm/eventfd.c
> +++ b/virt/kvm/eventfd.c
> @@ -214,9 +214,9 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
>  
>  	if (flags & EPOLLHUP) {
>  		/* The eventfd is closing, detach from KVM */
> -		unsigned long flags;
> +		unsigned long iflags;
>  
> -		spin_lock_irqsave(&kvm->irqfds.lock, flags);
> +		spin_lock_irqsave(&kvm->irqfds.lock, iflags);
>  
>  		/*
>  		 * We must check if someone deactivated the irqfd before
> @@ -230,7 +230,7 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
>  		if (irqfd_is_active(irqfd))
>  			irqfd_deactivate(irqfd);
>  
> -		spin_unlock_irqrestore(&kvm->irqfds.lock, flags);
> +		spin_unlock_irqrestore(&kvm->irqfds.lock, iflags);
>  	}
>  
>  	return 0;
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
