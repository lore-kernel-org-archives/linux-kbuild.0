Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AE48A2AC;
	Tue,  5 May 2026 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777996123; cv=none; b=FdRaEWKaChh7G5EdaZyRdxabbSpqKB9bUWA9cWxf8poJXAPOgDFkNpiHjK7ur/0Z3k6s9IeMCnFIOKRWl6nctRofgtiKaWa8RD+9w+35doxYui4VmZdPA3dyFAQdGGxbSJwV9pifmpn15Mjl5HM70cyPIjDHXb1mFTna738A6KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777996123; c=relaxed/simple;
	bh=sPt8QCw97y+bSuSf9ZbsQX4cPKPD+Mv6U7XrbNA+fN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/ijSsdBresKsny/zCtvkGYfIbdMHKjon5cm5XqJ/6h5NazMvWVqaYo6Dlhue56y0ir2QBb/81HyXUMKMzX7uFGQNIfpbSVYF9P25HTF2lnYjUT+gYdPN01vPv+m1EOz584CuvZ8etTceDRGOwFoQFebDJEuZCRxCcUQQA1wmhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TP94/sBj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TP94/sBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF5DC2BCB4;
	Tue,  5 May 2026 15:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777996123;
	bh=sPt8QCw97y+bSuSf9ZbsQX4cPKPD+Mv6U7XrbNA+fN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TP94/sBj8COsFYLwjYLqeHwcQ8YaduzVRj0kBcni2b/fUpciNk+tPpuUu2WJvTQQu
	 OZgz4V0ZTr0bp8hOFkm5gMTGmzvk7WXrBvKYdJSUmUChLpFHIF/+C/yRdzrGjC4fdY
	 UYJ0UdryMTMViMVcT+X0s7K4QPUWCYPQxF7Y3zq9x2i/9+40R1BIUcN+UAlXZFZ+BH
	 53Hn6vsUc4XrFJL+ALohHvki7Xl7VYZyswhtpfpQPnq6933oeFMwXgZOx4xNZ2TTWR
	 Ey7H5m+CNRfQiWmxuAUvHNQgKQgansY1eXkT9Tcy/36BmpbeTb4TuGvm/cFrbv5+Jo
	 L93oNSbskNfXA==
Message-ID: <669fbc9a-a243-43e8-8888-93bfb9d6ee12@kernel.org>
Date: Tue, 5 May 2026 17:48:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] objtool/powerpc: Add build-time fixup of alternate
 feature branch targets
To: Peter Zijlstra <peterz@infradead.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>
Cc: nathan@kernel.org, nsc@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, jpoimboe@kernel.org,
 ojeda@kernel.org, masahiroy@kernel.org, lossin@kernel.org,
 tamird@kernel.org, thomas.weissschuh@linutronix.de, rostedt@goodmis.org,
 ihor.solodrai@linux.dev, thuth@redhat.com, pmladek@suse.com,
 aliceryhl@google.com, elver@google.com, kees@kernel.org, legion@kernel.org,
 ardb@kernel.org, yuxuan.zuo@outlook.com, alexghiti@rivosinc.com,
 alexandre.chartre@oracle.com, bp@alien8.de, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <20260505144949.GO3102924@noisy.programming.kicks-ass.net>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260505144949.GO3102924@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 05/05/2026 à 16:49, Peter Zijlstra a écrit :
> On Tue, May 05, 2026 at 04:45:39PM +0200, Peter Zijlstra wrote:
>> On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
>>>   	switch (opcode) {
>>> +	case 16:
>>
>> Like case 18 below, this wants a comment describing which instruction
>> this is; bclr ?

No, it is bc/bca/bcl/bcla, it is quite similar to type 18 which is 
b/ba/bl/bla, but that's a conditional branch to a 14-bit offset while 
type 18 is a non-conditional branch to a 24-bit offset (10 bits are the 
conditional in the bc, hence the reduced offset size).


> 
> Also, isn't that typically used for return, suggesting at least
> something should have INSN_RETURN on?
> 

bclr (which is the return INSN_RETURN) has type 19

By the way you can have a look at 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/bfa8364da047d8610a09458a1cd924a0566aedbb.1736955567.git.christophe.leroy@csgroup.eu/

That patch has all the objtool decoding. By the way objtool is missing a 
INSN_CONDITIONAL_RETURN, also see 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/537e5d8f181b1f1c2b8918f1aefa1dba3f972c03.1736955567.git.christophe.leroy@csgroup.eu/



>>> +		if (ins & 1)
>>> +			typ = INSN_OTHER;
>>> +		else
>>> +			typ = INSN_JUMP_CONDITIONAL;
>>> +		imm = ins & 0xfffc;
>>> +		if (imm & 0x8000)
>>> +			imm -= 0x10000;
>>> +		insn->immediate = imm | aa;
>>> +		break;
>>> +
>>>   	case 18: /* b[l][a] */
>>>   		if (ins == 0x48000005)	/* bl .+4 */
>>>   			typ = INSN_OTHER;

