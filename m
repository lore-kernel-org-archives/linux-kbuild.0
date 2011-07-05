Return-Path: <linux-kbuild-owner@vger.kernel.org>
Message-Id: <4E12F9EB020000780004C219@nat28.tlf.novell.com>
Date: Tue, 05 Jul 2011 10:47:55 +0100
From: "Jan Beulich" <JBeulich@novell.com>
Subject: Re: sorting of exports breaks modpost's GPL checking
References: <4E11F1C6020000780004C089@nat28.tlf.novell.com>
 <CAPk1OjGKD+i=RkfMq9GX_HeOdNSH1o5Bp2Ge6QXGy0edi+1kSQ@mail.gmail.com>
In-Reply-To: <CAPk1OjGKD+i=RkfMq9GX_HeOdNSH1o5Bp2Ge6QXGy0edi+1kSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alessio Igor Bogani <abogani@kernel.org>
Cc: rusty@rustcorp.com.au, linux-kbuild@vger.kernel.org

>>> On 05.07.11 at 11:36, Alessio Igor Bogani <abogani@kernel.org> wrote:
> Dear Mr. Beulich,
> 
> 2011/7/4 Jan Beulich <JBeulich@novell.com>:
>> Is it known (and being worked on) that exported symbols residing
>> themselves in modules are no longer properly handled by modpost,
>> due to the .o files to be linked into .ko (other than vmlinux and the
>> .ko files) still carrying the ___ksymtab*+<symbol> sections?
>>
>> If not - what are the thoughts to resolve this?
> [...]
> 
> Could you tell me how reproduce the problem?

Just look at Modules.symvers - all the symbols coming from modules
will be tagged "(unknown)" rather than EXPORT_SYMBOL,
EXPORT_SYMBOL_GPL, etc.

As to reproducing the actual bad behavior - creating a non-GPL
module that consumes a GPL-only export should be all you need.

Jan

