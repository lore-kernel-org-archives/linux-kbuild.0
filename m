Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445036;
	b=VC1pkDMpIZ+6FL9ZUfLsf69IxB//M4sIvCZNosSlFkrO/JZzUiVta10cO7KK1Bwhf04a
	 IzD5PuRJC4kgV0KSwYXjKj/KIlhmM+54MZ79a8MmB9k6s7hvqU2YsQ+j9pZEgn+SuUG8j
	 2JrVLX1HCKZLJtggfZcZ0OeWH7ez3zXCwhqYwfFd6YekSB98qCKUBefKa/FHqUWpqMKxe
	 yeXjdvWTi5aQGkNjcLKxE/19cW05LMNQHsqsaTpWGoW/04Uyt7Vb9hfqDJ+UP6wLWmP6d
	 dKmuSCIAHTQw7a7xoORjcglKnEoZf4KSG6W2w7WJIWb1WxKxjugINyf1uo4rErtM3ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
	b=npqrlwQoeKtGv52tcc6TWepnI4+tW7y17eeC6gxBMzvQuU5cZGnBhLcx2vNyWJkmWAP0
	 vzimELLbungctwOmX30CCQOcOKjK1WZ54Ai0YRlOW1iMWaO7UceI+l/NxFR7ZvrzoFaIY
	 LjdkRkw4Iy3yuUu/nIwpISUZ17IeIjSB8ufkBVJfBDw790kukLo+AK98tRz81wzrjTbU+
	 7BLj/qUKtqK37G8yUyTokxZSFQOZhjKqDePbSkzc7pCRR9J90Fin9DqUafitKdP2eRDs7
	 wonDFt2KkgRKk6FxfjE1hJk+znd1s28vtdRS1sSvBqKorCPe22XwPRVm4UtfhHFg/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbgRnpKc;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E9606A31D
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 21:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC2E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QbgRnpKc
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso12151045e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Oct 2026 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445034; x=1793049834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=QbgRnpKcUz5rTSFrEESh5eGT4y6PY7bom6NOx7auUnO7JaG1IdgdlXTORoqwQwTUVZ
         paLiWbCPnIkUlP2WyWm/gm47nVIRU2Ev49y74gvdWyxeH0MtTlufn1qZPQQ2JAyJS4JH
         PzH1erZ+3nm2MzBK2VUyzvt9RfA16RkA5XFXo5ZJZg75/VJqME4FmXvtbEiGL8vWvjR7
         726pdggKUNcM3ljju89kYhWEn3AXo9yr0EpEg4uEJrCOkxvKgs1LACyajP2SJOUjIbgF
         Axdj+2fLUkk0zHx+SEUVTEr2K7IWdEsXxzJLv2pXmHltXTE5WWk1e+bKwyCcUAA/5wML
         KNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445034; x=1793049834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=YWpF1DaTPIxyAFvQ/u6PPImE2SMU1+JlyLfsi9aqC3soyYWTLi/QXYkCGOeJ7LUsWY
         p1JviueeHNxhlkBycnsXVnYmsaWl9VfAlZ8HyJlB1smPQhpPPofNWvgyy/Q0KViSXU8n
         UYU+VhxCFbKzzuKN9pkdyjyyOAtErgzWf+vEHPTIHsbpI5e+Q1M0V+QCZ709aahJumPO
         gvtYHSb5pgEd9JtZfvSlr41wEHyq5s/VpsPtq0BTv/mp/IIxmnYbQbFp1LrAiog9tc/g
         18lg3vjGqwORtc5mSvOE7Lb1IkLrjOXWJGkk+QE3YagreJkmVc76Yi3DPTqtdToINkmD
         ikxg==
X-Forwarded-Encrypted: i=1; AKwUvBzDd2NI2tXsnnB1WLiN1mZDEaeRINLBoZxKO4RBbzllzIKfCQBoZQeB2Q5lwpk52e9QDtlNCjWT0j7VSTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYImla5gYrcVRCKzD3yLXlz23wfDqdYYXYw/qr4A+EuIIl/wUs1n
	SsnghTpYctu19XSWwB4E6M/9ZPD0SOicwqv2SsZDtWg81niPZkIJwduP
X-Gm-Gg: AYBFou0glOgF3h8wAsT8CsmXwllX/N5CyxUHGN67wNRyJujNXeRtWTYqikOEZ3ySZQL
	iTxoKjlgjAiq5p87UhZuaU+eFxhRUcgzMlbsSzXNuYSljRBP0hHb1OVnRUeYVF3E0LDhZ345b+g
	ddDMObX3CvlD172mnsssJm9Zyd0WA7Q5poNLDgHdY64JRbQZUJRjPm1/BaEGZ5eC7PXZgLuZlCG
	+cf/5GWkGyV4m3iBQ4/SqDljDUPiKVb6+xVrUDGyx/akgIyAynMVCjs04abZHkEWVMAIUbPwX5g
	wK1XOy7MqncGo02EJdcIAZsCfFWTIpdd0gZQSU2WPc9B20k6hHUosN8FnnIh+yDaPNQ7V45noR+
	QxbEXU8ZRkPlfm5Aehmh5BTQaE3Dfe7HioAZjJw5C57FEALLqno8VfTU+2jR05tLeOuyT4G0f0h
	6CILyv8EErN6xY40nl5RAPHfW9RWGtWgVb+gLmD8yoeJe4UDUpAkSyGZvMyQ6i8+pcGRlA7nwxG
	wgYxCeKR+9WgSAh33smQkyzhsOGRLPIZyvQ5t/rZGUogw==
X-Received: by 2002:a05:600c:e549:20b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1d7624601mr116807835e9.26.1792445034012;
        Mon, 19 Oct 2026 14:23:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e2def9ecsm97956265e9.1.2026.10.19.14.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:23:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:23:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output
 file size
Message-ID: <20261019222351.64bb9d35@pumpkin>
In-Reply-To: <202610200336.6v4SE96n-lkp@intel.com>
References: <20261018155206.132411-15-david.laight.linux@gmail.com>
	<202610200336.6v4SE96n-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 03:50:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-15-david.laight.linux%40gmail.com
> patch subject: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output file size
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200336.6v4SE96n-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> scripts/kallsyms.c:371:26: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ~~~~~~~~~~~~~~~^~~~
>    scripts/kallsyms.c:371:26: note: use array indexing to silence this warning

Hmmm it gives the same error for (!i + "string") even though that doesn't even look
like a broken attempt to append to the string.


>      371 |                         printf("\n\t.short\t" + !i);
>          |                                               ^   
>          |                                &              [   ]
> >> scripts/kallsyms.c:371:11: warning: format string is not a string literal (potentially insecure) [-Wformat-security]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ^~~~~~~~~~~~~~~~~~~

The compiler ought to do better there...
Indeed, gcc does.

...
>    366		output_label("kallsyms_token_index");
>    367		for (i = 0; i < 256; i++) {
>    368			if (i & 15)
>    369				printf(",");
>    370			else
>  > 371				printf("\n\t.short\t" + !i);  
>    372			printf("%u", best_idx[i]);
>    373		}

I knew I should have interleaved putchar() and fputs() with the printf().
They are somewhat faster - in this file it is measurable.
gcc does convert printf() to putchar() or puts() but not fputs().

The time taken to write the files halves if I initialise an array with all the
",%u" values and use fputs(str[byte_val] + !comma).
I decided someone would object to the mess.

I'll think of something for v3.

David

