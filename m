Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:54071 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752208AbeEOFYX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 May 2018 01:24:23 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 3/4] powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
In-Reply-To: <20180514112826.1b820335@gandalf.local.home>
References: <20180514035228.21316-1-npiggin@gmail.com> <20180514035228.21316-4-npiggin@gmail.com> <20180514112826.1b820335@gandalf.local.home>
Date: Tue, 15 May 2018 15:24:21 +1000
Message-ID: <87tvr9o5iy.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org

Steven Rostedt <rostedt@goodmis.org> writes:
> On Mon, 14 May 2018 13:52:27 +1000
> Nicholas Piggin <npiggin@gmail.com> wrote:
>> The powerpc toolchain can compile combinations of 32/64 bit and
>> big/little endian, so it's convenient to consider, e.g.,
>> 
>>   `CC -m64 -mbig-endian`
>> 
>> To be the C compiler for the purpose of invoking it to build target
>> artifacts. So overriding the the CC variable to include thse flags
...
>> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
>> index 191eb949d52c..3c67304a7425 100755
>> --- a/scripts/recordmcount.pl
>> +++ b/scripts/recordmcount.pl
>> @@ -274,6 +274,13 @@ if ($arch eq "x86_64") {
>>      if ($bits == 64) {
>>  	$type = ".quad";
>>      }
>> +    if ($endian eq "big") {
>> +	    $cc .= " -mbig-endian ";
>> +	    $ld .= " -EB ";
>> +    } else {
>> +	    $cc .= " -mlittle-endian ";
>> +	    $ld .= " -EL ";
>> +    }
>
> Have you tried building all current archs with function tracing enabled
> to make sure this doesn't break any of them? I can do it if you want.

We shouldn't need to should we? This is only touching powerpc specific
code (if I understand perl that is).

eg:

$ git diff -U9 scripts/recordmcount.pl
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 191eb949d52c..3c67304a7425 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -268,18 +268,25 @@ if ($arch eq "x86_64") {
 } elsif ($arch eq "powerpc") {
     $local_regex = "^[0-9a-fA-F]+\\s+t\\s+(\\.?\\S+)";
     # See comment in the sparc64 section for why we use '\w'.
     $function_regex = "^([0-9a-fA-F]+)\\s+<(\\.?\\w*?)>:";
     $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s\\.?_mcount\$";
 
     if ($bits == 64) {
        $type = ".quad";
     }
+    if ($endian eq "big") {
+           $cc .= " -mbig-endian ";
+           $ld .= " -EB ";
+    } else {
+           $cc .= " -mlittle-endian ";
+           $ld .= " -EL ";
+    }
 
 } elsif ($arch eq "arm") {
     $alignment = 2;
     $section_type = '%progbits';
     $mcount_regex = "^\\s*([0-9a-fA-F]+):\\s*R_ARM_(CALL|PC24|THM_CALL)" .
                        "\\s+(__gnu_mcount_nc|mcount)\$";
 
 } elsif ($arch eq "arm64") {
     $alignment = 3;


cheers
