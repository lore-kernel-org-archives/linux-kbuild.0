Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCB0475344
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986349; cv=none; b=Wu2dhU7qqKXUhXg136pNEB0PIN9jlhmHgZ/Ie6Ks4zXUIMlF2pPp8Fn/jpTsSplItPiwpVX5Nrk8pm4hnmd9h1kL2zGlntMEW8KQFhkRzqmqhOFIApEBaHkVvVqJO1XQomtoop5XDKLXibDpyBnwhAZaJfDLT3p/WX/58QcF8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986349; c=relaxed/simple;
	bh=jB61ulPo4+2OXOWbLsMqmY+bgBX8tMYEW3pXzpN0lAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cu1F+YEW7mfdJJG0zvlzTdOmDcdssj5p3BEAV4Iv9kJIP29OZlsIWTQN661vrAf1EhO6zYGHJbabNCGKOXRZjzuX+rG/nUVonPLYaGVZP130xrGlzMdFLlrbzS0K2ALSB0UBHKDKLjGRGQ9uFHzTz4RTfNHhkYNJ1nEu6f5i9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElP/c9ue; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElP/c9ue"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so13408695e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986346; x=1790591146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7p3QHD6gpRm3mxOZTPCZ9KfFr3tYnokBkqHdCAaLmw=;
        b=ElP/c9ue+yJsk2teQtO4yB7NXhbYne+K+YJbGjHpt0JHuPq4vyDYfg4BQYdYRKoH1m
         er8UQilLfbHdsDAuyOFeQC2fbx9ufYuejcVIZaehSOpUm5ye9oZmTSA+ucr8OtCXnQpQ
         vpmYZDRNkoNXxZA0DZlwdS+SIQ6F8s6qWjUJiDSSzlhksi+WOZvKQ9gdBjJRBI6sLvya
         mRbq7wrmbpDnGOFyuD6Hp5EtNtlnaHy0++bKjPKML0qNRqkH/iOR19W2GcoDQSxF8XR7
         n2butbkgYkb5urKswsWLyXMQX0TeJi9JUNK5hm1Xs4aCwNVMj1cVkmxjRQ5Ymgb5fI7e
         zmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986346; x=1790591146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q7p3QHD6gpRm3mxOZTPCZ9KfFr3tYnokBkqHdCAaLmw=;
        b=pUFSjzxz7pbwgb/rdR5LAcH4R4DsHeC5nWGwFdUi3yF0BDm8vUycVgVCvuxQWiOwrG
         ltz+e/fSuRKThcP+zKx1lBc6aFNmGDVXLSStsYUOtlvUpKzbVc6yOTKV7trOrJ6RYcCy
         Gv5U6giKNgjov937gwU2WRaXmMLbOe6hxlcYLGn5cILQmllGMbFIEVspEO1+sbIrDiJE
         yKwz9LD/JEDeB7dCvt6Mu5iLzJ4XvYCUemnWJqGS6cqI7PfTmDL+DqTTcjBcUDYMSiWw
         8h7rqQ9yPHEgB8lgX8g53lYHlHNQM5KLoO7GCYDdvs4WWPyxdkN2hrHVUCPtKAAV+doV
         Jr9g==
X-Forwarded-Encrypted: i=1; AKwUvBzOHvrmFvOny7FIda7HmkxND9CWy7UxNIyDzdTjYpuN0lilPHkfeKFsqg8WNDS5v4omTDgbVvlaXrpYO4I=@vger.kernel.org
X-Gm-Message-State: AFuF++mYejjRBkDOgApgjyatnEeMdilb+o+4DTh/DavH0/1M9iqnM9G7
	8ANibwU7af99XVx1Pzp5qp8t6uCW0rJRYGW+Vk6abiHPWIeT5kxJUZlJ
X-Gm-Gg: AYBFou3ZBqpBIiH5OTOvOPVNzHGgHGSrW8mk9xgmu3h+I/jsvtXoQQsg9SN8AchUN5E
	xp9emAWzd0yB9nn8ffI/2tsJ90u2hlOmYtDx6eIEYOiSsDyHJB6+vFL18x3E5nK39X58QttHTBG
	IcxpNbyyFi4Du2/77WuVp20QbyeJNnNYZCddN3XlmLhIiUj5CdPWNBdsyLiJQNyU4nH9DecA5R3
	JiWxI+0o6Hm/g8JG4N9i3tGv3WtvFUKsNDaKHbsLEvpCnWZXsKzHMIowk4qAAnGKwQhhrCnn2IR
	fy72CGwwSY1poA05EadwxJm0hD2qF/Jt5XvpilCjx+It78ZMJ3wjWeF0HGIXWa3Wj+Tivg4krKe
	ocfVyXyL+T8jalrdmziL3s+/mHW50sOkUW/Tjf5a+FYZv2i0Brjlj1MiF+Kr4GeHwDNM66m4iiJ
	VcVZGxtctKIjriTu7hlZUZpQkL8yqYNKvtB+PVEyoTcaAEoR9JORzJxKoNd3oA7KJMnTqT96kwb
	ezTxedChEmwsF7oOYg6NzGAEc2e6eOgjcxxVTYctQWkytbgxsRBRhZYY/200mwG4tU=
X-Received: by 2002:a05:600c:4f8c:b0:49f:c18a:61c8 with SMTP id 5b1f17b1804b1-49fc573f858mr140670845e9.29.1789986345436;
        Mon, 21 Sep 2026 03:25:45 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068124sm213889965e9.3.2026.09.21.03.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:25:44 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c3ed62e7-732c-40fe-ba1e-f820b9473cc9@gmail.com>
Date: Mon, 21 Sep 2026 11:25:41 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kconfig: Add "def_string", "def_int" and "def_hex"
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Nicolas Pitre <nico@fluxnic.net>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 Nauman Sabir <officialnaumansabir@gmail.com>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Matthew Maurer <mmaurer@google.com>, Graham Roff <grahamr@qti.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, conor.dooley@microchip.com
References: <20260919005923.i.879-kees@kernel.org>
 <20260919005929.4077729-1-kees@kernel.org>
 <cdebaad4-00c2-4b80-b688-0f5a723d6009@gmail.com>
 <202609191431.C3BCBCD@keescook>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <202609191431.C3BCBCD@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/26 04:40, Kees Cook wrote:

>> The second problem, is that since the order of defaults matters and
>> conditions can shadow each other, def_<type> makes it harder for users
>> to get defaults right. In the past, I've seen several config options
>> with bugged defaults due to 'default' + 'def_<type>' [2][3][4].
> 
> This is the one I, too, got worried about. From your example:
> 
>  config GUEST_STATE_BUFFER_TEST
> -	def_tristate n
> +	def_tristate KUNIT_ALL_TESTS
>  	prompt "Enable Guest State Buffer unit tests"
>  	depends on KUNIT
>  	depends on KVM_BOOK3S_HV_POSSIBLE
> -	default KUNIT_ALL_TESTS
>  	help
> 
> Is there a way to detect this state? (I assume as a follow-up; it's a
> general problem.)

Unfortunately there's no way to avoid some false alarms when checking
these due to macros.

Example:

    config TUNE_CPU
        string
        depends on POWERPC64_CPU
        default "-mtune=power10" if $(cc-option,-mtune=power10)
        default "-mtune=power9"  if $(cc-option,-mtune=power9)
        default "-mtune=power8"  if $(cc-option,-mtune=power8)

These macros get evaluated during preprocessing, which is ahead of when
the parse tree is finished and analysis can run.

Though a check for it is included in kconfirm (if merged) [1], and I've
also been thinking about making this part of an optional KCONFIG_LINT
setting, where some false positives could be acceptable.

[1]
https://lore.kernel.org/all/20260727001623.2794156-1-julianbraha@gmail.com/

- Julian Braha
