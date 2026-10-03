Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E8425866
	for <linux-kbuild@vger.kernel.org>; Sat,  3 Oct 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029953; cv=none; b=iQlg58X969gJG4TCBjUYgMyRnHg5O9blziJiLUA9TAxSsgIfy81y83/N73y/4of3RtXSyI1I4jyqHM64Um503iwJwXRknexhalQNe6IvGLN1z85YrsJBrQkyJgePYIzuQHafmrqlMWeIrbcEk3CLqgwe4MThbTSyYhwFt1L8YMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029953; c=relaxed/simple;
	bh=V0/7vUbzZ2WS3ekKYc+/9kx/XXTqOYvzaiHvHZHSBnk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=RdvKgLz1SZnAdqqQWsmyFaMcuFR5tzr/F3fXXs/8bla4khNZw5TRmmNjwv8/PceI8A+/lvLuWkX88Kp/dDTF0Qr+BOJzRXbIg9nSrzHGL/1Zm3Dob8XJ17v3WGqLRTDxBwAEVplveWtHzbkUFGIwvsRf0bcdeFgjfezWz+muTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ya1uPvVe; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ya1uPvVe"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so161020a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 03 Oct 2026 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791029944; x=1791634744; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V0/7vUbzZ2WS3ekKYc+/9kx/XXTqOYvzaiHvHZHSBnk=;
        b=Ya1uPvVeeM6n17IR0e8tR+Fjn4A7Tt8xHAj2K4RCLwhM/hfRH2CLdq5KVXsqQ+7+x3
         Bjh71FLm+eHABWYeuAqtB8u41rC6u3Gv0BBngTOtNGGVVoYenWZdoIx3EaA3DW/NqxEm
         r1BZUyVLORTMFFEYNnrQzZPkAX5SzAzBvz9lKEZ3dm47fm7OGnnuU6Pf8eBH/fTDejMv
         npC3Z2mnofQdhE53ZvxxScLXy/4abR1ig/Pap4sIskWXMbYdPYLxYYrtmb8UwcnIJNTw
         789AGnYTn0CFfvhsFtKtHWJVNh1VUA9JUAmfn7mEfHa9u0CqKMUz5YKq5/iDP7QXZpvj
         C1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791029944; x=1791634744;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0/7vUbzZ2WS3ekKYc+/9kx/XXTqOYvzaiHvHZHSBnk=;
        b=qWdDc66CmFN7W2VDrEQZpFzaqcqYPbQ+M2XnMaewDboYcn7O0sqSTvsWnVPRZSTtAA
         gJdLL3nAjn5MDu3hf48SRrm4md82zrawl48TYBnN1FUxre+PMrM3W2Ct2WfX0Dsa6eZu
         1dMerfLe7hEY7Jehf7rK8GXocEA5ASTXDQTYPfiBCHeUHx0vQnkFWk1UIcpl0RijJ6WE
         xRPu6Ar3dd76T6S36elrV5vcyMvg7T34dwNy44cv2TdGHyL7mhJCMMq4DlotwrNwbCHk
         lzzxLIGRIiL4AFiZ1hjTi5pPpoq9zR7iuTYDTjXEx/2n2OYqP0Fj2gl353Kxp2pbVJa+
         2LfQ==
X-Forwarded-Encrypted: i=1; AKwUvByLSZ/3aLhYf6+8oqRv/24GrjP5M33y60gNcRzqgavGvWk5rHU5Iflkwbm5uin7+vMmdWDsmKx15sTyM3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kdf1PLcB9TiOeZR0WxNYvcswHnfO024Nsh4tuk/WWb920kldXZ
	KHZi+bQaOQQy3TGO1j5MNS/j+J+YyG5DC6Zne/7KIWjzQf/J5KpSMwfQ
X-Gm-Gg: AYBFou0KT8iB0tu2S2zXeS0FI7Ao6Rkn9shsDQjuEd3HRStVjvFK4TFpOoTKRM/hqdA
	+CC8BKP0qciB6yEb2yyMWVYfkMtB7L1oWdVmo76AqcIStUzfkws/WEGztr9fhvFYm25onRY8Gbo
	502rBGKqJMQ9aWGAaMZ2h++UHNqZJ2r9Nzva413vQiQItYfZ9kRJYNp/MGPIzihQSxed0XOWMPL
	O68R18PV/O9tAGvJSKvvTqUvmRSyvWnalfuezHlIiYrwjFr/4GJYU3AavvynDMMlV4bp4rokWJS
	q69z/l/HAPvHrs+zH42KsnWLnqKlDh9/4nnG3o0MtLAffvORiHeeKXsv1Wu9nZSzRKnGPXwFFez
	uyEaxLmi0mk9lODt2Hb6DcF7aS8uIISOaEjEU1t7dzyOKf8GY3DyH40nrN7XalZ6PDqAwSI1G6d
	JQsKFz37M491xxvdpQVRkQLLcQGFyvuYZUEY9R8Q+lIbzSkFAyhQYqMcv49EMV2yC4GFEYn4oYb
	agza/VzLJNl9REfqww0n4kz3C6VuNXOaEzYO1UkR4rlBk6QhHc226+O+fNtRBuCwqnV9T02YFf/
	MYA=
X-Received: by 2002:a05:6a21:d89:b0:3dd:a197:7360 with SMTP id adf61e73a8af0-3e0d6d8ff80mr2052536637.57.1791029943830;
        Sat, 03 Oct 2026 05:19:03 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cca561e9d1dsm1740373a12.6.2026.10.03.05.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 05:19:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 12:19:02 +0000
Message-Id: <DLV74KRI1SBL.MYZVQAB3N6QG@gmail.com>
Cc: <abuehaze@amazon.com>, <acme@kernel.org>, <andrii@kernel.org>,
 <arighi@nvidia.com>, <arnd@arndb.de>, <bentiss@kernel.org>,
 <bpf@vger.kernel.org>, <changwoo@igalia.com>, <christian@heusel.eu>,
 <daniel@iogearbox.net>, <doebel@amazon.de>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <irogers@google.com>,
 <jay.wang.upstream@gmail.com>, <jikos@kernel.org>, <jolsa@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-modules@vger.kernel.org>,
 <linux-perf-users@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux@weissschuh.net>, <martin.lau@linux.dev>,
 <mathieu.desnoyers@efficios.com>, <mcgrof@kernel.org>, <memxor@gmail.com>,
 <mhiramat@kernel.org>, <mpohlack@amazon.de>, <namhyung@kernel.org>,
 <nathan@kernel.org>, <nsc@kernel.org>, <ojeda@kernel.org>,
 <petr.pavlu@suse.com>, <qmo@kernel.org>, <rostedt@goodmis.org>,
 <rust-for-linux@vger.kernel.org>, <samitolvanen@google.com>,
 <sched-ext@lists.linux.dev>, <shuah@kernel.org>, <tj@kernel.org>,
 <void@manifault.com>, <wanjay@amazon.com>, <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next v4 00/12] bpf: make the vmlinux BTF an
 on-demand loadable module (CONFIG_DEBUG_INFO_BTF=m) to save ~5.4 MB memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Alan Maguire" <alan.maguire@oracle.com>
In-Reply-To: <7fe71959-1c58-4b6f-9019-6f886683530e@oracle.com>
References: <DLUZVHOLSN1B.115EUX4KJBEA3@gmail.com> <7fe71959-1c58-4b6f-9019-6f886683530e@oracle.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Oct 03, 2026 at 12:45 PM Alan Maguire <alan.maguire@oracle.com> wrote:
> The only overall cost is if when we wind up using vmlinux BTF with the compressed
> .BTF section, since we have to do a full vmlinux BTF allocation (on top of the
> spac taken up by the compressed .BTF section) right? So slight penalty if vmlinux
> is used, but big gain if not.

I think it can be copied compressed into vmalloc area and
freed after decompress, so memory usage should be exactly the same.
