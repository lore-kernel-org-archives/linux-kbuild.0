Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99D372058
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Sep 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761533; cv=none; b=M2+bBW4/cZUgbB04rWZjtqApirE4s+R5zixiyz2TZAkOqEQgZWRd8plP91cvT8WoGn7wUTCc3gfONPI9DvVQgs01oAi8xgl3RXll3ee3+OHocp89bP4Qrdyvor8+JqsvUvYS3LntEfNKfHaPdTyrgidB9k5D8NqAbsP5ILQyQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761533; c=relaxed/simple;
	bh=c25CUSij+eMnuS4A1qRkp1rkPikWXnelKmG6ITMAUQE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lum8xyHWB9/VpLxOr7y8sWr58jbOjtlUsH5pZbMbTBMcbqYEvdrp5016JH9wMvaP6Qv4gqT96sFY7LzgU/MVaJvPY4q2SNxAgxVu7PRc2Kca8FBPgKYvp93m5YGwsyERAKhn0+toUgpfeGQCRjRgPHIs9uLrrO03VngmkZkqcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FgPMvE+E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FgPMvE+E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so2889901f8f.3
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Sep 2026 23:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788761530; x=1789366330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FgpPh779agkaJsZ5OdwLcUmt5HapS7rGj3gZwhgzCq8=;
        b=FgPMvE+ELREy7rk6koLnBYclA8rwKXwZAbrX1P2PITTFliXOPi6D7zrIRbwOjggOLA
         BnOoTeBdz3BhakwTxBAC1PCJMekSAuOUdchLsuwqbp9do9gH1mcmlP04dnTH6M5pl0FS
         1qY1fopaJcjYsPnUStebWCx0/yMsDONdjPAXsrY30SBGR/AIPX1NA9+PKebIdgR5D1Oh
         ldBZISHrCLoU8FbfC8OKRH+DY3fy4TlOWG4qFnktfl/SB7ilJ9E/ZPDA3i+uSHGha1iJ
         GhQ5fAFroDXMKXW+br48oRMe6SvqrmfZH0ajFplO7qr9DdUoY/eUueLiD5Rhy7aDj7Do
         NLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761530; x=1789366330;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgpPh779agkaJsZ5OdwLcUmt5HapS7rGj3gZwhgzCq8=;
        b=IiHL+CnITD6F//gTNSwFm53WAqfkAi/z2pRtMwYfTmVstlHVXTPB59CExe0e6ZrTzx
         DcKEaQQ+LzBDTlSboIO/DnPkHYO7NcxJtqi7DRzmWDobjavFPgVt3CKO28IUGUwO7moz
         YIEkOnYl4vewPfKGbMaDaGluvSAPTEOrB4WtYQZtYgqLtcUfjjCCRLkiiNDgnmgi3D48
         +mJySC25peo8fNkbi1ipd1ammrsGPfhr3LYKU5thvYORRGKn+TpM8y2JL2mAFu3ibAEx
         HDZuUTlKzvO/caz1uv/rRT/PUeXLoTb2or050f/yuzOUL3XNlL5xbE9Rb88i1kZAT0u7
         /hVg==
X-Gm-Message-State: AFuF++lKIQiDrgX88NkBK19r74cItBN1ewxxKYGP8gc0Pr3IscXtBbR7
	C4hyRtf3izkNfLtUImXFZTEHgPQwkL7PK8owQfNu4LOO99WnP7Ksf7TTSylLbeipkzQ/96K08H3
	drlRkjg==
X-Gm-Gg: AYBFou1fSARkvF3uSFVhiQzcbRvrJVLHr6NVTgs5a3aqKA8lnI/GMexqGU2IJx87VOC
	sTOyn4G9+CiEr+pgE9mtjHISyI58Hf0Zu6mFnrGHlB3lwIf2IqhZSOXbkKYstPNQV2nQ0vzHODx
	UoaVMAQgeDTS15uDzLhCMsovskEDZvtXzMoenHdnwcKNSzi/DBLEh1sskPYOBNDbYjnCrgMrSEG
	qNFElih1VfmXSSV1hDa3Rbrhh+6PkoCkAZM1b140ho4TVTKurWm2llWFCwe4lvvADsaHbz8q/7x
	rHU9sOW2eg9ThkMaIzU+nE+ter1Hjl1ZPN6ZgpcBebB6S2ekieHgtsMPsDIFM+jHWt1iIHzBlTA
	X4myxTrjgn+j8UmZEEVdzGG2ciswjFIN9Jkzvcr/NqY3JiejpI0AuJXzzq9ovmkWbALkx4pUnNu
	2GzNGTevrXfDG3NxoViCvZVUHQORkmEaOJaNnr4sgOSgr1VsI5PrGQl/EhpSapEXzY8cPEh98zf
	+uYYVZC61QQmLTxhDyXCWwS3s9mk3UQScaS2LlnR0WbpD0Vmebi7lpA4AMqe4s=
X-Received: by 2002:a05:600c:4e11:b0:49c:f2f4:eddd with SMTP id 5b1f17b1804b1-49cf8268795mr222231175e9.16.1788761529971;
        Sun, 06 Sep 2026 23:12:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm165653915e9.5.2026.09.06.23.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:12:09 -0700 (PDT)
Message-ID: <58b455fc-814d-4de1-ba2b-262db82b4e28@suse.com>
Date: Mon, 7 Sep 2026 08:12:08 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] kallsyms: also special-case symbols aliasing _sinittext
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In the Xen project, where we use a clone of kallsyms, we encountered the
(rare) situation of trailing symbols immediately ahead of _sinittext
moving between passes 1 and 2 in a way that in just one of the two passes
they would actually alias _sinittext. The same can clearly happen to
Linux.

To consistently discard such symbols on all passes, extend the existing
"corner case" by also considering aliases with _sinittext (_stext really
shouldn't have anything ahead of it). But discard only non-text symbols
there, to avoid discarding true aliases, and assuming that what comes
immediately ahead is (typically r/o) data.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm also a little puzzled by the verification done: The extra linking pass
is engaged if the sizes of the two earlier objects aren't the same. The
sizes, however, can be the same even if there are changes. Later
System.map is also compared against the last pass'es .syms, yet both are
first passed through mksysmap filtering, which removes far more symbols
than kallsyms does. Hence no difference there again doesn't necessarily
mean the symbol table hasn't changed.

--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -222,6 +222,11 @@ static int symbol_valid(const struct sym
 		    (s->addr == text_range_inittext->end &&
 		     strcmp(name, text_range_inittext->end_sym)))
 			return 0;
+		/* Same for non-text aliases of _sinittext. */
+		if (toupper(s->sym[0]) != 'T'
+		    && s->addr == text_range_inittext->start
+		    && strcmp(name, text_range_inittext->start_sym))
+			return 0;
 	}
 
 	return 1;
