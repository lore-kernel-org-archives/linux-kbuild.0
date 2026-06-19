Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2AC26ED25
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Jun 2026 01:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781830894; cv=none; b=deLXk9hbeetqw2I164/uUqPG+r+OL7PzjgM8CIrxnoQyuMWcB/b/MbKYqAmEjUd5bDVuFYFYlFpQpxubFVuBi/DNgSfHt/bIqMGSGv5FgldBHNj6eZtQFNwHE97iq1UBN81LaD2y9xpwU96DFXSP4Vu9paxY5C7FrhzlgOcY1Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781830894; c=relaxed/simple;
	bh=0BpQE+MLK8ygVFWMCGPfPCcd3XYmy8dz/lbglEKRlGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pDuxBTeSVpOEWI48zWaiizHXs3bPvh89dcSr4DbXa4DD+Ai6NMyvPvjTRNNbWwvz8+MX2IT7AcnAYntqVpCAEnq/lMmFZdUop7HqgM8gRmP3V5u8r0Kla7/gBP3NufwhsBZhANzNwMEOT9V//+S4SYyOkh18tICf4vhaoS1SfuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8PpMNOH; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8PpMNOH"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bf854d5feso2338494eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 18:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781830892; x=1782435692; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b4Kz/CJlQLDa0qon5uW3Vu21M3pPr+qVXqFwNmQJ4QM=;
        b=C8PpMNOHJdjvQnF80WOCBMsX9lL8LEBN1Mm536+6lZPJa3K17S83K/mVyZ1cGNImz+
         pelyVdgyprUz4P7KNDYlXRSCUj2c11qjDKxxGCyRL3mbvZUZ0KTDh7HlnQUqjRbl53iz
         GiY4ZwdpqopwjcyToqDMNTx4jCm4mFXwwyogVgdkcHCpr3vwJZqeEqy2GycRBWz9HSdO
         fNdEgPOUrzk6LNOv8Xlk+/kJrGe6WyacyOPnnD5+bC4S/mbOLnxPcyZMraP1L8p7z/94
         Rpv0jQpuFxpExM8A5waslHqOVD9a2VR78EyggBElgGHeA8o1ziPvRc/rtdmh1kbsadKo
         +KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781830892; x=1782435692;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Kz/CJlQLDa0qon5uW3Vu21M3pPr+qVXqFwNmQJ4QM=;
        b=WXlzXaq5mBPbTQHPU7f1KdpVnaq7JsRar5eYobzL05L3WVkJG//FCMAZ6Fo9Y7U3kX
         m8o0YfhBGY/y8ZeD7x1NXhFrccDpBEZcoRBTaVDMVsCUUnAUtXHIzPnczmEO1os3vJfI
         7jnnKq6WmSY5APK0QoVu1Eiurrx16/k7fV06wouFSo+UzKEWu8kckI1p0HXVEziwSeAA
         pxji+qwTlc0RCtsYni3xtk9Bq8UKoGRNhvg9sWb2ehdG0OZE1WVWTmap6bL0xAFeOugl
         +HRvJQr28wJdgOvgD6JAKcDxmOVznjITyYl25HJsb4kJZgalz6Vh76is++ddhGf4zJ3e
         ljuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SYSQ3D0OTLXTLBs7k2j+8QJQDygSTzxqqdniDlSNe9aNXxQfMPk+nU/F4cY5pkZgwqKSnDz9KiszIK+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZORrc54FQ27ufBSzJLVCtzKtIrHwIFY1TVdz4eX6x074cWOB
	Lblvc/E/yE9vOC7tHgIBjsnDzqvQsa/EkV7qQBvAXcPsMLhTKJL+SUPa
X-Gm-Gg: AfdE7cmdUqs8L64lrm2rZ3Zr4cwlU1553FbzIJ3nLfgdXAGFgFPtFxFFlR0HV9+I9qo
	63lgBWfCyEeoqYaGR5zk9iduewks1czRm2GR9YZArYsDZzdCnN+nMM4DVtL/7jZ6SSs8JUEEad9
	7NsqjY9ZJQjiDUfxxjJxIUZIQFKbrJ2CQXngmooS5qiQbEpPB2E9Jbt3AqTKONSB6cUYESqersN
	hubl4Wesrw83bs3MHxaRko5WVPyzxOavSWmvrNbsNiDr0Zjum+ErQz5uKOPBI6ngpHgWbW7rHeZ
	y/aAWNpBflihQhD8aSa405M1V7xVjHMS5ylEWbHZZZ30mR+vKYF1Xl6h4g2+PEiAKlXnwln2sFB
	PvY7+Ygsr92JGEDtXU9AuhmuQVbuKgEKydBWtv6SWpzy0w3uZUtZLBMJ83qRd9r7MXkaEwrEcLW
	GMA4WlD4yMmeblNapd/iTqZpCFeCDOqBKPIU2NfNuwwcFa6ABqHeERnJDBGFE2FE4iA89l
X-Received: by 2002:a05:7300:c89:b0:304:e58b:cccb with SMTP id 5a478bee46e88-30c06fea688mr1125542eec.2.1781830891772;
        Thu, 18 Jun 2026 18:01:31 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:ae6d:cb3e:a1c:6cba? ([2620:10d:c090:500::3:8ac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c06d5bec5sm985094eec.26.2026.06.18.18.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 18:01:30 -0700 (PDT)
Message-ID: <5c88bd7f01c7c156bb112f0f720dc9faffc7363b.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 4/4] selftests/bpf: Add kfunc set test to
 resolve_btfids
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Date: Thu, 18 Jun 2026 18:01:28 -0700
In-Reply-To: <20260617210619.1562858-5-ihor.solodrai@linux.dev>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
	 <20260617210619.1562858-5-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-06-17 at 14:06 -0700, Ihor Solodrai wrote:

[...]

> @@ -161,6 +189,27 @@ void test_resolve_btfids(void)
>  			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
>  	}
> =20
> +	/* Check BTF_KFUNCS_START(test_kfunc_set) */
> +	ASSERT_EQ(test_kfunc_set.flags, BTF_SET8_KFUNCS, "kfunc_set_flags");
> +	ASSERT_EQ(test_kfunc_set.cnt, ARRAY_SIZE(kfunc_symbols), "kfunc_set_cnt=
");
> +
> +	for (i =3D 0; i < test_kfunc_set.cnt; i++) {
> +		for (j =3D 0; j < ARRAY_SIZE(kfunc_symbols); j++) {
> +			if (kfunc_symbols[j].id =3D=3D (s32)test_kfunc_set.pairs[i].id) {
> +				ASSERT_EQ(test_kfunc_set.pairs[i].flags,
> +					  kfunc_symbols[j].flags, "kfunc_flags_check");
> +				break;
> +			}
> +		}
> +
> +		ASSERT_TRUE(j < ARRAY_SIZE(kfunc_symbols), "kfunc_id_found");
> +
> +		if (i > 0) {
> +			ASSERT_LE(test_kfunc_set.pairs[i - 1].id,
> +				  test_kfunc_set.pairs[i].id, "kfunc_sort_check");
> +		}

To assert the sorted property, should one define two sets?
{ a, b } and { b, a }? And check both.
Otherwise the id assignments might be an artifact of compiler BTF
generation logic.

> +	}
> +
>  out:
>  	btf__free(btf);
>  }

[...]
