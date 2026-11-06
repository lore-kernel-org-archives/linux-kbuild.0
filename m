Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793927117;
	b=3f+WY41WJMzFtzLl0RvN5y8f9sI3F/LOJVW8W5TEsO9RYliPokcf6LrbEGN5x0X4oe9H
	 dEbMVthULjqSum0k3/NcoJFGuSBC35TofzPA1j+hDziYlcGxaiUTPlQ9SjmpbGq39YVD2
	 pwAfvOggFkGm80PKrCJyXa9jhyPzsfT99KwHnKphENk1cLbIiFVXoZs44JmUZRH12+P48
	 iCa4a3MtfAVj7INs8nkK91iIbUHK09D7V74PuU2LvO4XpRYbE2YSIPkooG2gmNAqX+UXJ
	 h+zHXFauuMNj434TyVs7CPySdDJcQRLShpGPsPeavCcToPduF4J3BCewl6ENfeAjgEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927117;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BVgc+AzhfIkWn3XFbykm8OIvXrj/6LpWvdi1FoSSDjc=;
	b=cnUglzqU9o3U8pgXD9swx1GR8CzN1q6lJWilSiCgbQUrKroNndmH5O59jPlXMfn2gegB
	 LUWs96i6+siGvFSwfqP00A1kjX+x71fpftpQulsrqu3ZeyvnF6w5Zz0X2qY3kQTm8KwS3
	 m+jn4dsXVPcGy9fclxpf2vmghr/paOy3RzkbJDurZiG+Bu5csylS6JCFwaNo3bMOiwmvX
	 cnkNa/nhqbZe2yCUxYE3qgvzfwvPFZi1bLZsJAaYRqV+Ttq4wF8CZJ+lXTghNcp5Ltciy
	 8ll8DqGM4Czou+z49T6ImazWz41ZviraYQdBQQ92voogg7cdLaqg9V8So8P3ztjxL5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVtOZoHl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E270C606A31B;
	Fri,  6 Nov 2026 01:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVtOZoHl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B2C1F0089F;
	Fri,  6 Nov 2026 01:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793927116;
	bh=BVgc+AzhfIkWn3XFbykm8OIvXrj/6LpWvdi1FoSSDjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TVtOZoHlI6hCOwoFtnb5qhDpwAK0a5Plk//VfLhhH2lY+RegXuCbeexltBAJnrUJj
	 GMJbPTzbm5DwX4B9ohk3ep+c8ZWRmL9L67gOZyalcncjEUtxQ8bRzEyPFlDqH6l5bt
	 bvA4tNM/LOPp4RkUTGWrSirFXFAq4mvflA4D7zMJSD+Oy8M7GoR1UbWXbV8Y7CqLgX
	 9p4fryCb3DoF1wHm8Y8DJilz6vJw3zIkuDFUW0fH/F/LpNCBq4Y2x2nC4lViGmnPcR
	 0Tr6+XHjsmpwb5BUngBvD3Vd/uFOV0lsWws/0srVyUlIw6ALDN4xBSaH7D0DZhDsQ/
	 AW6KTDiI5FrKw==
From: Sasha Levin <sashal@kernel.org>
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Chuck Wolber <chuck@wolber.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org,
	linux-um@lists.infradead.org,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Subject: Re: [PATCH v2 19/20] gcov: add MC/DC condition coverage support
Date: Thu,  5 Nov 2026 20:05:12 -0500
Message-ID: <20261106010512.3647568-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dd2b2658-cb4a-4ba9-b69c-470d433a0ef5@linux.ibm.com>
References: <20261103015238.3780910-1-sashal@kernel.org> <20261103015238.3780910-20-sashal@kernel.org> <dd2b2658-cb4a-4ba9-b69c-470d433a0ef5@linux.ibm.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 06:56:10PM +0100, Peter Oberparleiter wrote:
>> +	depends on LLVM_COV_KERNEL || (GCOV_KERNEL && CC_HAS_CONDITION_COVERAGE)
>> +	depends on !LLVM_COV_KERNEL || CLANG_VERSION >= 220000 || !WERROR
>
>Would it make sense to transform this for readability, i.e.
>
>depends on !(LLVM_COV_KERNEL && CLANG_VERSION < 220000 && WERROR)

Yes, that reads better. I'll switch to it in v3, thanks.

-- 
Thanks,
Sasha
