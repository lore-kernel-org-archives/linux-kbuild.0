Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F352EBDDE
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955163; cv=none; b=MVJad+NkqouQxNGD9E62Z4NBJ2rl/QSXrQrE7zlYLaeM/R7jt3EEL3nicsvmDwLL+Eqi9JNRR1QSim9pZwKptnNu/uXE13cQJOLUk8NRiaV5tzCPMk61xDO/CP4k3LpG3RTBzOMEraiRK6m3v+LGWRSoDuy5/fGsPfksNgrRWhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955163; c=relaxed/simple;
	bh=JGnjQU6PmvoVpzokeD8OddWVnnwHcBgSMqRPY494K6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho1Kvzr44Ib4IOGHpSZGCZ/4DBlkRmoQZ0sKKDd4xjNZ1Y1wSZYj8XhnOBoprUvKZ6ij/HMZteKMGQShuBRq8/r/S1QpsGTbxhzs9O8gIfs9KtzVmhG+O4jbf2m/btjIG/SaxM4UnDpkrau4DPl3QetmvbALoH3uXkg7nJ37C/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSMSVvB+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSMSVvB+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4421F00893;
	Mon,  8 Jun 2026 21:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780955162;
	bh=TnDb5JPvIGixLud3pzCMsni1IvAcyYizZVzbKY1uMMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSMSVvB+d0ddgWucB+qHt9frCYd73Phpb+WxiqikLItwBB9jowBQ6fVPzYIlJ6otn
	 6j74QoU4D1609pHTQ69ZOArlbVHwR92I5eeclE7tXksfyPdxtZ0SJnVfK+kl1tX6ev
	 DuNZFmw2xypPRa5ymNtWGxqvvw81jMv3wmRdZOewoabl+M+TdC2XstgMGVw5grTiHs
	 flf3ti7i/9PI9GiX3S+qhcv6Y4kh7OtGR0TNidoWEYO1g9lZ1v/6ARqdmsItAQPKcd
	 fVy/xB48QwAgismLC1TgnxI+qywAD6V1AZjTnQjptOTYpoSlWFlAmwILGgBq0k6o4m
	 DARKMAECgTbOA==
Date: Mon, 8 Jun 2026 14:45:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Nicolas Schier <nsc@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andy Lutomirski <luto@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] init/Kconfig: Update the THREAD_INFO_IN_TASK description
Message-ID: <20260608214558.GA2340474@ax162>
References: <20260606092501.3200459-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606092501.3200459-1-chenhuacai@loongson.cn>

Hi Huacai,

On Sat, Jun 06, 2026 at 05:25:01PM +0800, Huacai Chen wrote:
> When commit c65eacbe290b81 ("sched/core: Allow putting thread_info into
> task_struct") introduces THREAD_INFO_IN_TASK in 4.9, the only supported
> architecture is x86 and thread_info only has a flags field. The Kconfig
> description said thread_info should only has the flags field but didn't
> explain the reason.
> 
> When commit c02433dd6de32f ("arm64: split thread_info from task stack")
> introduces THREAD_INFO_IN_TASK for arm64 in 4.10, its thread_info has
> more fields than a single flags, and arm64 works well.
> 
> Then commit 37a8f7c38339b2 ("x86/asm: Move 'status' from thread_struct
> to thread_info") adds status back to thread_info for x86 in 4.16, and
> x86 still works well.
> 
> After that, risc-v, powerpc and many other architectures all introduce
> THREAD_INFO_IN_TASK and their thread_info have more fields rather than
> a single flags field, of course they also work well.
> 
> I don't know the exact reason of the original description, but obviously
> it is wrong and misleading, so I update it, let LoongArch and some other
> architectures easier to support THREAD_INFO_IN_TASK.
> 
> Also improve the try_get_task_stack() and put_task_stack() description.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

You addressed this to Kbuild folks but I don't really think this is our
domain. I think you would be better off sending this to the scheduler
folks or Andrew Morton.

> ---
>  init/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 2937c4d308ae..a9466879d553 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -207,11 +207,12 @@ config THREAD_INFO_IN_TASK
>  	bool
>  	help
>  	  Select this to move thread_info off the stack into task_struct.  To
> -	  make this work, an arch will need to remove all thread_info fields
> -	  except flags and fix any runtime bugs.
> +	  make this work, an arch will need to remove the task_struct pointer
> +	  field from thread_info and fix any runtime bugs.
>  
>  	  One subtle change that will be needed is to use try_get_task_stack()
> -	  and put_task_stack() in save_thread_stack_tsk() and get_wchan().
> +	  and put_task_stack() in save_thread_stack_tsk(), get_wchan() and any
> +	  other stacktrace functions.
>  
>  menu "General setup"
>  
> -- 
> 2.52.0
> 

-- 
Cheers,
Nathan
