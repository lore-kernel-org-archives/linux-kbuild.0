Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:44211 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751756AbZBWKOK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2009 05:14:10 -0500
Message-ID: <49A276E0.9010603@redhat.com>
Date: Mon, 23 Feb 2009 12:13:52 +0200
From: Avi Kivity <avi@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH] tracing/markers: make markers select tracepoints
References: <499edf47.1818d00a.060b.2b8d@mx.google.com> <499EE162.4050008@oracle.com> <20090220172241.GF24538@elte.hu> <20090220173107.GH5732@nowhere> <20090220174811.GL24538@elte.hu>
In-Reply-To: <20090220174811.GL24538@elte.hu>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Ingo Molnar wrote:
>         KVMTRACE_3D(MSR_READ, &svm->vcpu, ecx, (u32)data,
>                     (u32)(data >> 32), handler);
>
> after:
>
> 	kvm_trace("MSR_READ: %p, %08lx, %016Lx\n", &svm->vcpu, ecx, data);
>
> As a result all these traces would become a lot more readable 
> (and a lot more flexible) both in the source code, and in the 
> trace output stage.
>
> And any ad-hoc tracepoint can be added, without worrying about 
> the name of the macro or the number of type of arguments. Note 
> that in this specific example we didnt need to split up the u64 
> 'data' into two 32-bit values, nor do we have to pass in the 
> 'handler' name, nor do we have to provide a MSR_READ 
> enumeration.
>
> The tracing-disabled case would still be as fast - a single 
> branch check.
>
> Avi, what do you think, any objections against an RFC patchset 
> that shows this off?
>
>   

Definitely, as long as formatting is performed after the data is 
gathered (say, in userspace).  kvmtrace can generate around 1M 
events/sec/cpu, so we need truly low overhead.

-- 
error compiling committee.c: too many arguments to function

