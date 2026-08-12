Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9243BDA1;
	Wed, 12 Aug 2026 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539210; cv=none; b=fMQ3GP1qZTn274LoDeDx+60L6aaQfaAffZJVOA1BE+Rd/wrjeM2JVShqOaRgE3ksRs8oNRJ1v20RML5YclmBL/gM1CgKmMu/Z6F9uxlyJhc1+9sRBcqnyQUYfKK46yX2qYgfIT77lqDPcSfHOhh27mchFUOTI6fCdpFGbz2wHu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539210; c=relaxed/simple;
	bh=tLbhtegLnHHyBYb+4Zf3AqPKth7kmsWZhWHOk4l3trk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJBNvWQiLtgfTLtOTDt5GtqyhYQ625aIdtBxiYL0rhJPI8j8Elu+lDWTNyxe/e+xuKxl5waYi/4wSwVVsPYBOczAT2O0QlsCkPZXd7rasHoV+GI7oc4QAoEB9bSQ9n//7HBHWhlV9VvQAR/0h/U6k1ujK3MQFOBjpcqtG1w8LK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jSPD8Wh1; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jSPD8Wh1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=ymajvFEoy0q2y1+jHdhgdGXTB3/6CBb7zkw8dtenTkg=; b=jSPD8Wh16i92t5krm9TlllJAUI
	kXV/icsfQZ/0GiR+5nZ3CpAIvjr3XwN2w5LUCLqEKIE2auHTtfxVlme+vPLikjRd7lK+dukqXk39c
	+0c3emwvieTv2lfXyA2C4h4wQoNWRFSQJvWXT2Gd3x0yaRDpx+UfaJEf9WB9Z/4LpHd4OpiIlXd6s
	Tl133usb5960g3McUSRoHL333wHvOVX7lNl+XVfQSbsZ+hoCG+7zL7XwaIo/SysMshjpG4dvsUx23
	Q+SYMswo2snHejLdBF8cophM6is1areEYQy0FezDZjJY5CLtoxbqoUZEjRAHYnXtq9N0N4QN/rqiQ
	2Sfil3Lw==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wu8SR-0001wz-OW; Wed, 12 Aug 2026 14:53:23 +0200
Message-ID: <b1d599ef-bdf2-43e4-9746-4fc8d8f1e817@igalia.com>
Date: Wed, 12 Aug 2026 09:53:21 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] mips: Get rid of custom mips ABIs for syscall
 tables
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
 <20260812-tonyk-syscall_table-v4-8-748d0229ad40@igalia.com>
 <ca0326a0-ce13-4bfc-b36c-5612d73335fa@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <ca0326a0-ce13-4bfc-b36c-5612d73335fa@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 12/08/2026 06:16, Arnd Bergmann escreveu:
> On Wed, Aug 12, 2026, at 05:33, André Almeida wrote:
>> Get rid of the mips exclusive ABIs for the syscall tables and replace them
>> with the common ABI names, replacing n32 and o32 with 32 and n64 with 64.
>>
>> No functional change happens, but it simplifies and helps to unify the
>> tables.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> I had expected you to use 'common' instead of '32' and '64' here. Since you
> did not combine the n32/n64 tables, this makes no practical difference,
> but it still makes the tables look different from all the other ones, and
> it means that the following patch to unify the tables is harder to
> validate since the inputs are still not line-identical.
> 
> Is there some reason you went with this approach?
> 
Ops, no good reason here, it was a mistake :) I will redo it to use 
common from [1, 211] syscalls. What about o32? Should I kept it as o32, 
giving that it doesn't make much difference?
