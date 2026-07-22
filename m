Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A168470453
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jul 2026 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705704; cv=none; b=ZCpqX901EiL0GELMN+rqXbrADSHPu4ZzwPH2GIX8Jf4j0Nig5peKaZc1aHBkcLw44n5uU1lUgo1m+kf7EigmXMNjWDW6o4gKw76hra1wIztvUGEPKxydxW/P2hA8tQAmRbrcpev0LyFDmwKTGdqfYD/ES0kTVTTkATEdHG2lWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705704; c=relaxed/simple;
	bh=eKHNTpG8GeaQeY2i5bEe4P4iN/d2moJubLRJufXBQQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AS8+1ZvcgGR1qll8IIt9zPd/QqE/sv9pvTlhxOk13QmCFzBBt4VLO2X72CiCOPoOZBH4M8FmCuQSkqlvEOYtoxgXdf5nqqR8qz4WXBT3gXLGLyCYK0G5RZO16XuXCrE2uBIkbLWeKEfdwCpHHScEJ4BLPLddH6EHYr5xuDjJXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K5FTw2B7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgSZoTd8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5FTw2B7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgSZoTd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784705696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qCpDJW2Bpsr2ftPYk3wlvArcTLJKr4kApWixoUdEe7k=;
	b=K5FTw2B70r73KgjWdkkSKs0rJLAxDXnA2GG+rf2Q3zDUQlyeNnFqiZJ0rvxJTd1tIvuwPO
	4PEJwsIgLdE37AfM01XcnKWujqqw/KdBkmFlOKkNFR8AmwDiAnaO5ANIhjfK6OnBhwY7CU
	6LYMqJeBpSaUey03mdoTWisTwNdpxb0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-46Sg2wNXNcS8jCQW_R8ntw-1; Wed, 22 Jul 2026 03:34:54 -0400
X-MC-Unique: 46Sg2wNXNcS8jCQW_R8ntw-1
X-Mimecast-MFC-AGG-ID: 46Sg2wNXNcS8jCQW_R8ntw_1784705693
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so48875275e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jul 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784705693; x=1785310493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qCpDJW2Bpsr2ftPYk3wlvArcTLJKr4kApWixoUdEe7k=;
        b=hgSZoTd8GsHt7uGhhVBZk4VfnqzFfSRdrBFf6CZ3LEJWPHashYagrPTtBZ65Rkl9MG
         Kn/SGRmDv98Of5+8eR8PBrW5Ry8lopm/F6XB1IJHiEU7o68tPx3G5AJrye5MLu/myMI7
         aWcfhyfacWPBSpOc5hIIE7vj7hhz2TseuHG6Ek3eWnlCinPzA7r+m8kr/flYcLJBz/ab
         P3cboNun9PrGyREBn8HZUvJ3uxo5YjaxLZF+/o2tJAJT07KSPNA13EyezCMY6SoSET5+
         TbzxvwCm3eznUG/efv5swtNu8c34yaVl6Lhm/Yvk3E7MYgwtTbcvK/cmpCWBenYWdz3E
         IMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784705693; x=1785310493;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qCpDJW2Bpsr2ftPYk3wlvArcTLJKr4kApWixoUdEe7k=;
        b=eaiVRhKtqSoBxZygm/SmzYMMpS+CU4zsFxGzlYxagqbrt+iZ00AQYAgfX5MWfX+UAl
         c+6WOWNiixKCAeunU/oVQ2zaZBKoc4iKSatj+Z9rDJEJujeh+l2eG+Q7bkpHWQiMccxv
         9KVMAFYDMm+zNrxlqPc99N32i9nCaTCK5iywMay7gZwHymC+G67UcTKHRnCGAvxri2gt
         VHtIM73BGNzV6o6FUGNUye49idnd93FB4Ji0xvpPB+6SEb3QOeO3GY276d0R7hKI+i3q
         XvVS8RpJiyEuSMgP1yl3Y0xG67m615NDuX27vGLydzj/GbrZh1rmZ+Z0zHZxsMtRd/ME
         R/YQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXGE2Ms35Kfz5c23H/gIULnItOt4sL8J83rYs3jXeLUwGDLGtvIrorG3G+JPGbiqWgBw3CTZ18PKYMYbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtADR0opEycz+os+OUjQ/OaHryJINgcqUcMohgwSOtt+ZtmKY
	cq++8g4lVRV470V9D3dwc8WTOxUUNhXXNLGV/cTtQDA234LPqvBtEZdIEov9/h513CH/7mLZZ+T
	auXBF2zVfPz8UN7rZFtbzSplAVRGlv6rYjBsC7iQDeWmwkZ1TNw87Zoicb6sRifRufrD9UiNR2A
	==
X-Gm-Gg: AR+sD11adVO9nV3ieKTntFXFQB3i2XfZerPb9E10P8u39kyiHI9HQHvHmU8/dh1Amf5
	Vn2THRJHRLwC73e1d+19Ttha4pQDnbfO5LPXipef1q7mK5MSjNsOBXYUR6z4QUQuXvSd8GuLCFo
	pGHKdKFnmancZWpSHd/lybruIVv3bHFWdpHCrbgSlFcXQ0gByWqmzmjxI6lSMxxzAfhFM0kXopN
	BQXyGJLcVN+Dv1NuqoZgqwFzlxaTDp+PI1yvhJrt+OajHvnrsDIIVzX1iFIIIwC5QftK2aUW8Dl
	vGtQk3mR+PX9MfQzWBsT+MuQZmyOEfDS5rf6dby+TBFZNQiVkVbT6espAtOJJWAn9MpcET3VeQ=
	=
X-Received: by 2002:a05:600c:1d25:b0:495:6c44:633f with SMTP id 5b1f17b1804b1-4956c4463c8mr9002835e9.31.1784705693448;
        Wed, 22 Jul 2026 00:34:53 -0700 (PDT)
X-Received: by 2002:a05:600c:1d25:b0:495:6c44:633f with SMTP id 5b1f17b1804b1-4956c4463c8mr9002675e9.31.1784705693088;
        Wed, 22 Jul 2026 00:34:53 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565304aefsm116293645e9.0.2026.07.22.00.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:34:52 -0700 (PDT)
Message-ID: <74311a07-afd1-46ff-b5e2-503de903366f@redhat.com>
Date: Wed, 22 Jul 2026 09:34:50 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nicolas Schier <n.schier@fritz.com>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Nick Huang <sef1548@gmail.com>,
 linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
References: <20260720101025.355623-1-thuth@redhat.com>
 <b83f2696-ec0e-4c35-98bf-1094588dfad1@t-8ch.de>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <b83f2696-ec0e-4c35-98bf-1094588dfad1@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2026 23.32, Thomas Weißschuh wrote:
> On 2026-07-20 12:10:25+0200, Thomas Huth wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> A previous patch to headers_install.sh normalized the usage of
>> __ASSEMBLER__ to __ASSEMBLY__ in the UAPI headers due to the
>> assumption that older versions of GCC might not define __ASSEMBLER__
>> automatically and thus using __ASSEMBLER__ in the UAPI headers might
>> break compilation with very old versions of GCC. However, as we now
>> reassured, even GCC 2.95 still defines __ASSEMBLER__ automatically
>> (and even older versions are hopefully not in use with the current
>> Linux UAPI headers anymore).
>> __ASSEMBLER__ is also set automatically by other C compilers like PCC
>> (see https://github.com/IanHarvey/pcc/blob/cvs2git/2018.09.20/cc/cc/cc.1#L405)
>> and Tiny-C (see https://repo.or.cz/tinycc.git/commitdiff/a25325e9be13e52a),
>> so using __ASSEMBLER__ in UAPI header files should really be fine.
> 
> I am not that happy about this explanation. The note about old GCC was
> dropped in the committed version of the patch.
> It should be enough to just explain why __ASSEMBLER__ is better.
Ok, I sent a v2 with an updated patch description, I hope that's better:

  https://lore.kernel.org/lkml/20260722072928.24500-1-thuth@redhat.com/

If not, please provide a suggestion how it should look like.

  Thanks,
   Thomas

PS: Nicolas, I kept your Reviewed-by in v2 ... if you disagree with the 
updated patch description, please complain there!

