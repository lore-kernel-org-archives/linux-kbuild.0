Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355DD2EEE93
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791731366; cv=none; b=fY02btRxi4u3eBQ+/N6pJjlYH88btw5lAeagIu58Eb+9E4Q0JyNSNVt7FQS72hjF0TUhbhiIxDcSRabqWAfqfgyB+eM5f7GOQeqjbV4rWgvcUQhAu5T4z7zzqLg8Dh+hA9Rw6pAv9UxlI7mnmKnl9YPxW97X54aNS1tzLuAl1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791731366; c=relaxed/simple;
	bh=z716eksRuK3oeufJKol0pznuZJZZ9ix1HIHWejay1qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLytTA6J4AGDhQnhzH+YMcAo3nIpXw+YE/hIoJhU28ACeezR+RoBZC9ZT9QM8YodquxarI/zygVXmgqNni77wC5bk3nI9mgtuVZU8dTEM0mmMIFcF0QJN9N8rhBKTut+DCMzkO7RCfIKIh0lQR/cw7zR8Db69hCg3gviR1nX6y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPZPngqN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPZPngqN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so10536805e9.1
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Oct 2026 08:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791731363; x=1792336163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdn56d0EH+bT1nmTXkVjIqTfkofp+CToumTPS4Zj8QU=;
        b=BPZPngqNc3FAWBbJIfOvnLs7zQQ6Nf6u1h5i9CMOdIUJEc8idmnm2aU9kwRevMh7PJ
         eZOTIekyyQuGbXh76CB2pNWO5SACS9Z/Tk3zqIiOmx3Sd1AHYy2/md5BA+D0Rw697eFd
         UShlSfQuI3mIkmflxY0yq9MFD4bRWo74NBtifWWhwLgP6hJRiH9m9+DNr796BD55mvCB
         D0h+GMF8rkz2qMB+kcEh45Oi7Rwp9UBD//MNJlOLnZkIN+5CwdOdzYSE5o7UkFqccLNp
         mqjascwiJ6+cPusIWYnLjKcoQPKgOnVYryAE1v6UGEgEJGGIuWejGZaV9ZDAfylaKVcO
         G7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791731363; x=1792336163;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jdn56d0EH+bT1nmTXkVjIqTfkofp+CToumTPS4Zj8QU=;
        b=Wq07LNkEXNfNdRo78tVgkahqCzAr/OGf3o1uUEOTWLbtMLTlBkqFsO/3aMmLfhMcoe
         dGN+TFjx82Uatcox/ZxRGCYHiKjWkMTjZZuVkXNFCLsvP8q3QjotUMvPvB1cXGAthw0F
         xO3OneZtNSAnY0mGz9CV1JWYYYnqaHQD0MEka4bJiVo8wjSWAXIfRe8b/LC7O86nOMs7
         c31i6GjOpBjlt3VFXZXfoAd0GAPhecf9HI1nlYZ3PqtFEjfoaVkBx+qpA8RK28QDVbuG
         W0tb5mq0O3B1fiy6mou7iBlxjrAWz9d6zxvTFtkM5VZC+xEzljTr6tMuTCnLwhi9LRW7
         Q5jQ==
X-Gm-Message-State: AFq9FYLknmJKdhIHpdIxUGxqGoLtI9NOo/V94msYwW5UokEEP4aAyeZb
	rDf9O8jKwwW2k1UkVlIeyFxHX4IuCXd9jV4fdsziM+i2Drl0qzmlmUwO
X-Gm-Gg: AYBFou0iG2i8R54LcU19wNecnt55VUm6JXDCe+bc/006hc9ggT1Y86LhqG3t0umelvi
	4l5nieMLKQcF1kxLz0S5VKfF8cFH15fHLoUiq+334RK/nlWInyiBu3HpIY6l4Q1E6dFTl+jVRJ6
	A3q0Z/6TjOL7lKy4EB5GxeBk+u/04jAQw78IlCyqOhNNGW8Hot84Cmi3T0RNAy1Wc8nPVHbZUed
	VjO9om4h81DoVdxKeir+zpU/t6TlZni7fc4ifUpK8C72s9Inh8eEN6+Atqus/C6IE3W86ybjr1W
	siQGFdhcFFXY0sZYirKag5HAnUmx8N7HtpoPhWjPPoXCpj7PTUaTSlWlwc7gXAcQFpMz0H0VH8m
	sqssnyMCjLZcRNfjhXy6fT6wRR4/+XTqIo71vxTdTW9iAOSl6r5rm70YEGxLK28EeO+fHqDvNah
	U+0Nltv74cH40X6BfEXucMm/PCX0hl8n2+92VDomW5fI/XV8oJkWzaZtWI2HhescCida45Fm3OM
	aytluWrLxMXYGuugh4Xy1KvpSR/B4s=
X-Received: by 2002:a05:600c:34cf:b0:4a0:159b:d2a9 with SMTP id 5b1f17b1804b1-4a18e4d68aamr108650155e9.24.1791731363080;
        Sun, 11 Oct 2026 08:09:23 -0700 (PDT)
Received: from [10.0.10.92] ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm235673485e9.11.2026.10.11.08.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 08:09:22 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e868eae8-7fd4-4a13-bdac-92aa2198b84c@gmail.com>
Date: Sun, 11 Oct 2026 16:09:21 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: fix dangling check_top after an unexpected
 recursive dependency
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164528.3685545-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164528.3685545-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 17:45, Leizhen Zhang wrote:
> If the last symbol of a recursive dependency is a choice value,
> sym_check_print_recursive() pushes the on-stack cv_stack onto the
> dependency stack. If the choice is then not found on the stack, the
> function prints "unexpected recursive dependency error" and returns
> without removing cv_stack again. check_top is left pointing into the
> stack frame of the returned function, and the next dep_stack_remove()
> dereferences it:
> 
>   AddressSanitizer: stack-use-after-return ... in dep_stack_remove
> 
> This can be triggered by an (invalid) Kconfig file in which a symbol is
> a choice value of two choices and the second choice depends on it:
> 
>   choice
>   	prompt "c1"
>   config A
>   	bool "a"
>   endchoice
> 
>   choice
>   	prompt "c2"
>   	depends on A
>   config A
>   	bool "a"
>   endchoice
> 
> Jump to the existing cleanup at the end of the function instead of
> returning directly.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: d595cea62403 ("kconfig: print more info when we see a recursive dependency")
> Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

Reviewed-by: Julian Braha <julianbraha@gmail.com>
