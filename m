Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB532E040D
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2026 21:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483548; cv=none; b=gVCZioSTDwQY7n0mybY9U4jdGjmU4HPwxtUpjieDyYj9812vQ7hjUSr3Op/qTuT1ZYDqLNrkvHZ6e/Ix8m9suaAAJQIuzQexlfQV7XpPaFzOzsNnEQigDxwUljPKt0PF9CcjdZQcYOOMnPvVrHfwccZHt7XjwyerjB+pAbstomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483548; c=relaxed/simple;
	bh=knrq8G9aL0lWNJD9z3VZdZyqhA4LmHx/YcqYYrAGKJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8PMK70ZaVkws9vQDHfn5FyBWiMoifCWhvWyBC/Iago8YKcSAV41EMJ+S/wigAshKM7Sw5ApTFfTRa65xSUyfLkirZC2j89GsiwG00yKn9kBmyxfaKOO8594TZ9SGLDN+FSckIGlN/FhzXX5Os9slzVhuQH5rcBCjGoGIHYl08I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIG3Rzvy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIG3Rzvy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-481412f1828so72862f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2026 14:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786483545; x=1787088345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zag8yThC0DwTvmxQGCWLq/IdfVbwmShUYLOIEE7Smxg=;
        b=YIG3RzvyNhhgZdOFRvTwkqGRHi8wJzHADxrgcGSO4+QfMYq961FQE+h1XVzKzBUf95
         v0k2Znk9JSdrGcONcH7CvFR3pELF4x27OGDCP2DIquG0i+dRhaVcHuRofrHSncu2/Stp
         F6GKerQ1OQH5J78hmadN28/2sQcROAXt1aVzMYZnK51RcutWlse4GCKpmjOE/VhplsGA
         Rob7sgWL/Henp+carNmCJLAGyOVBuQaQ/G/SHHBwsGgBcZY0LWXrEuIj3VFUiBopZiCS
         +6avzF8QqFHwxU3hJOCEfzFprrjod0NzfhJrP6UNsvyCpz4LdyumT01j24hf1TpMTeIW
         6VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483545; x=1787088345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zag8yThC0DwTvmxQGCWLq/IdfVbwmShUYLOIEE7Smxg=;
        b=mt1AUfq06afwXfWpiHNXvKI/oItth7CNVQ22Mi+pa6BKCNMG5BFnGUJNN/YFP8AFxj
         5dkyIhIS4DjvPn8X/DWlTm0NVPePkUSQSzfWsoUsC6smRpXpKGYQDu+3dm7GEz5VWZut
         9YcBASFbH/c8pBrz/DP2CgB3MNGYZsYNZfnTrzAVhx3uKtJ0Pj0XvFigk9/OTucsy1Gc
         3dN8QN9cGo77kwNiYGavCCGvvbOZxm1Yd8s+S1VqbLXLtcMFyrLNuewwbLofS/3rBt1f
         or4t3ngGzdIJ2+Oe0eWAR5JY1PtPtxxH14fwRFfQP/5kSHhao01V1mZp/g5h8r9gAWvk
         jSxA==
X-Gm-Message-State: AOJu0YzbvQ9rsMvfBOoDm9fS3/rcefTPHEQQRtMdwV4Zl5yOgZlrpNti
	4jIOu0Oh2sjucDnHls4RvmYubmHomazthOsFSuf3Hn5KVAJPNbQ45fgdN5dTstWS
X-Gm-Gg: AR+sD11G0vHfMKjdstxP+ehojJVf86jMhH+8a6HzkK1dBt7DkZVkre5gW+GNmga/j/w
	xpjFOrKcxHFSbJrpiOAtW8WdnvEVKPrPOMpluarARyteDrKXpD5Ik9GVIi5kqDJMTJ7Qu4rRHWr
	ju3+MNP8H+aWcv2Rp6c31SFH2CJd5k42YUjBLy9XFon+6Si+F4vGeN60KCSj6GAhqvBGz9rmrav
	u1xCZwKgDHsBYFqiwqG7yGdXRN6TBHKZodMzv2rW9JZqk5qMnPbkVPN9SIat5BsjS0YToEqAlHp
	bHlL3U3K2Ll2hlODVQUWXW8XtLplUhEzqZjAxJqIN0raQqFsbqqcQxBylvQwpqEAKN5dr52VZhx
	QdKZ7qN6yjSFewQoce6khr8/Wj1tBrYS0qYEXzLZoB2xv8M3/W89UHd+0+rxF+ELuF+wpX+E3XI
	+/Y/nJoUpcEl2bDd7enYPAD72kbJS8FMzbSEK7rvBAT40QCF4gnktVzaPUtLeX40fP08fghKMYh
	FEre64amuKEcJMy4XVbs9SN2zaNEYZtVpZxaAAb868dHBHea2DeUS3C
X-Received: by 2002:a05:6000:3113:b0:481:512c:a205 with SMTP id ffacd0b85a97d-481512ca26fmr1093493f8f.1.1786483544651;
        Tue, 11 Aug 2026 14:25:44 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c057f0sm1344342f8f.9.2026.08.11.14.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 14:25:44 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <344a83f6-9fd0-45fd-840c-8789f3ed6a49@gmail.com>
Date: Tue, 11 Aug 2026 22:25:42 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: Warn on dead select or imply for choice values
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kees Cook <kees@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,

On 8/4/26 13:45, Nicolas Schier wrote:
> Update the internal kconfig check to print a warning on 'select' and
> 'imply' statements that target on choice values.
> 
> Julian Braha reported that kconfig's 'select' and 'imply' do not work
> for choice values but have no effect all.  Show a warning instead of
> error-out to allow kconfig to check the whole kconfig rule set.
> 
> Reported-by: Julian Braha <julianbraha@gmail.com>
> Closes: https://lore.kernel.org/linux-kbuild/20260715220149.48700-1-julianbraha@gmail.com/ # [1]
> Suggested-by: Kees Cook <kees@kernel.org>
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Reviewed-by: Julian Braha <julianbraha@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>

> ---
> Depends on related fixes in Kconfig files:
> https://lore.kernel.org/r/20260729203845.387239-1-julianbraha@gmail.com # change-requested
> https://lore.kernel.org/r/20260801160140.2391000-1-julianbraha@gmail.com # under-review
> https://lore.kernel.org/r/20260714112047.2304856-1-julianbraha@gmail.com # under-review
> https://lore.kernel.org/r/20260723104933.117413-1-julianbraha@gmail.com # applied to mips-next
> https://lore.kernel.org/r/20260723122818.437802-1-julianbraha@gmail.com # applied

Note that there was actually a 6th of these broken select-choices that I
had forgotten to list. Though my patch for that has also already been
applied:
https://lore.kernel.org/all/20260722220618.198164-1-julianbraha@gmail.com/

> ---
>  scripts/kconfig/menu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index b2d8d4e11e07..fc8d8cfe034d 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -287,6 +287,10 @@ static void sym_check_prop(struct symbol *sym)
>  				    "'%s' has wrong type. '%s' only "
>  				    "accept arguments of bool and "
>  				    "tristate type", sym2->name, use);
> +			if (sym_is_choice_value(sym2))
> +				prop_warn(prop,
> +					  "config symbol '%s' uses %s for '%s', but '%s' is a choice value",
> +					  sym->name, use, sym2->name, sym2->name);
>  			break;
>  		case P_RANGE:
>  			if (sym->type != S_INT && sym->type != S_HEX)
> 
> ---
> base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
> change-id: 20260802-kconfig-warn-on-dead-select-for-choice-value-bd71a1de1a96
> prerequisite-message-id: <20260729203845.387239-1-julianbraha@gmail.com>
> prerequisite-patch-id: 3bb796da65f588d1df5003dac5af7a9d7420f266
> prerequisite-message-id: <20260801160140.2391000-1-julianbraha@gmail.com>
> prerequisite-patch-id: 5277c28b2d25752fb7e5827ed744b0cf0c619574
> prerequisite-message-id: <20260714112047.2304856-1-julianbraha@gmail.com>
> prerequisite-patch-id: bef2d24caba30e7dc2ac5189c10b6473485a1e3c
> prerequisite-message-id: <20260723104933.117413-1-julianbraha@gmail.com>
> prerequisite-patch-id: da49e2868fbb19afc3195cbd2868739a94aa02c3
> prerequisite-message-id: <20260723122818.437802-1-julianbraha@gmail.com>
> prerequisite-patch-id: 3c894964a57e4e30515fcb14226dae725555c25e
> 
> Best regards,
> --  
> Nicolas
> 

- Julian Braha
