Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:34511 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750749AbbJRUeb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 Oct 2015 16:34:31 -0400
Received: by lfaz124 with SMTP id z124so98101567lfa.1
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2015 13:34:28 -0700 (PDT)
Date: Sun, 18 Oct 2015 22:34:58 +0200
From: Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [PATCH 2/9] KVM: arm: Do not indent the arguments of
 DECLARE_BITMAP
Message-ID: <20151018203458.GE7531@cbox>
References: <1444940195-28272-1-git-send-email-mmarek@suse.com>
 <1444940195-28272-3-git-send-email-mmarek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444940195-28272-3-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu

On Thu, Oct 15, 2015 at 10:16:28PM +0200, Michal Marek wrote:
> Besides being a coding style issue, it confuses make tags:
> 
> ctags: Warning: include/kvm/arm_vgic.h:307: null expansion of name pattern "\1"
> ctags: Warning: include/kvm/arm_vgic.h:308: null expansion of name pattern "\1"
> ctags: Warning: include/kvm/arm_vgic.h:309: null expansion of name pattern "\1"
> ctags: Warning: include/kvm/arm_vgic.h:317: null expansion of name pattern "\1"
> 
> Cc: kvmarm@lists.cs.columbia.edu
> Signed-off-by: Michal Marek <mmarek@suse.com>
> ---

Is not being able to deal with a whitespace not a make tags problem?

As for coding style, do we really entertain these kinds of changes just
to adhere to a coding style?  It feels unnecessary taints the log etc.

However, I'm curious what the general concesus and previous practice for
this sort of thing is?

Thanks,
-Christoffer

>  include/kvm/arm_vgic.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
> index d901f1a47be6..58c5c0eb8d2d 100644
> --- a/include/kvm/arm_vgic.h
> +++ b/include/kvm/arm_vgic.h
> @@ -304,9 +304,9 @@ struct vgic_cpu {
>  	u8		*vgic_irq_lr_map;
>  
>  	/* Pending/active/both interrupts on this VCPU */
> -	DECLARE_BITMAP(	pending_percpu, VGIC_NR_PRIVATE_IRQS);
> -	DECLARE_BITMAP(	active_percpu, VGIC_NR_PRIVATE_IRQS);
> -	DECLARE_BITMAP(	pend_act_percpu, VGIC_NR_PRIVATE_IRQS);
> +	DECLARE_BITMAP(pending_percpu, VGIC_NR_PRIVATE_IRQS);
> +	DECLARE_BITMAP(active_percpu, VGIC_NR_PRIVATE_IRQS);
> +	DECLARE_BITMAP(pend_act_percpu, VGIC_NR_PRIVATE_IRQS);
>  
>  	/* Pending/active/both shared interrupts, dynamically sized */
>  	unsigned long	*pending_shared;
> @@ -314,7 +314,7 @@ struct vgic_cpu {
>  	unsigned long   *pend_act_shared;
>  
>  	/* Bitmap of used/free list registers */
> -	DECLARE_BITMAP(	lr_used, VGIC_V2_MAX_LRS);
> +	DECLARE_BITMAP(lr_used, VGIC_V2_MAX_LRS);
>  
>  	/* Number of list registers on this CPU */
>  	int		nr_lr;
> -- 
> 2.1.4
> 
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
