Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36609 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750956AbdAOMoL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Jan 2017 07:44:11 -0500
Received: by mail-lf0-f47.google.com with SMTP id z134so61808464lff.3
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jan 2017 04:44:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <272f9e02-1b7e-ec99-e0ce-039faa5691ae@au1.ibm.com>
References: <20161125141506.30094-1-riku.voipio@linaro.org>
 <d059ce23-744b-3fc7-9a86-48a05f1b6fb3@au1.ibm.com> <272f9e02-1b7e-ec99-e0ce-039faa5691ae@au1.ibm.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Sun, 15 Jan 2017 14:44:09 +0200
Message-ID: <CAAqcGH=nwXu6w-m+KkhVKgAMqzFPqLE9zWE_gitYPUa6ha3eWA@mail.gmail.com>
Subject: Re: [PATCH] builddeb: add make fastdeb-pkg target
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, mmarek <mmarek@suse.cz>, debian-kernel <debian-kernel@lists.debian.org>, Jim Davis <jim.epost@gmail.com>

On 13 January 2017 at 08:54, Andrew Donnellan
<andrew.donnellan@au1.ibm.com> wrote:
> On 29/11/16 13:45, Andrew Donnellan wrote:
>>
>> On 26/11/16 01:15, riku.voipio@linaro.org wrote:
>>>
>>> From: Riku Voipio <riku.voipio@linaro.org>
>>>
>>> Currently, the deb-pkg and bindeb-pkg targets create multiple packages
>>> for the kernel binaries, headers, userspace headers and firmware.
>>>
>>> For developers who generate Debian packages as part of their development
>>> workflows, it's often not necessary to generate all these packages.
>>>
>>> Introduce new target, fastdeb-pkg, which only generates kernel packages.
>>> Re-order package build order so that kernel binary package is created
>>> first and we can exit cleanly unless generating rest packages with the
>>> old bindeb-pkg and deb-pkg targets.
>>>
>>> Cc: Jim Davis <jim.epost@gmail.com>
>>> Cc: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
>>> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
>>
>>
>> Some comments below. With those addressed:
>>
>> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

> It looks like this still hasn't been merged?

Well it adds a new Makefile target, so I'd like to hear from Michael
and others if that's ok.

Less controversial,  also missed 4.10: [PATCH v2] builddeb: Update a
few outdated and hardcoded strings. Which I guess could be updated for
2017 now...

Riku

>
> Andrew
>
>
>
>>
>>> ---
>>>  scripts/package/Makefile |  7 ++++++-
>>>  scripts/package/builddeb | 49
>>> +++++++++++++++++++++++++-----------------------
>>>  2 files changed, 32 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
>>> index 71b4a8a..c858366 100644
>>> --- a/scripts/package/Makefile
>>> +++ b/scripts/package/Makefile
>>> @@ -97,6 +97,10 @@ bindeb-pkg: FORCE
>>>      $(MAKE) KBUILD_SRC=
>>>      +$(call cmd,builddeb)
>>>
>>> +fastdeb-pkg: FORCE
>>> +    $(MAKE) KBUILD_SRC=
>>> +    +$(call cmd,builddeb)
>>> +
>>>  clean-dirs += $(objtree)/debian/
>>>
>>>
>>> @@ -142,7 +146,8 @@ help: FORCE
>>>      @echo '  rpm-pkg             - Build both source and binary RPM
>>> kernel packages'
>>>      @echo '  binrpm-pkg          - Build only the binary kernel RPM
>>> package'
>>>      @echo '  deb-pkg             - Build both source and binary deb
>>> kernel packages'
>>> -    @echo '  bindeb-pkg          - Build only the binary kernel deb
>>> package'
>>> +    @echo '  bindeb-pkg          - Build all binary kernel deb packages'
>>> +    @echo '  fastdeb-pkg         - Build only the binary kernel deb
>>> package'
>>
>>
>> Perhaps "kernel image deb package" to be more specific?
>>
>>>      @echo '  tar-pkg             - Build the kernel as an
>>> uncompressed tarball'
>>>      @echo '  targz-pkg           - Build the kernel as a gzip
>>> compressed tarball'
>>>      @echo '  tarbz2-pkg          - Build the kernel as a bzip2
>>> compressed tarball'
>>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>>> index 8ea9fd2..5035f57 100755
>>> --- a/scripts/package/builddeb
>>> +++ b/scripts/package/builddeb
>>> @@ -185,11 +185,6 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ;
>>> then
>>>      fi
>>>  fi
>>>
>>> -if [ "$ARCH" != "um" ]; then
>>> -    $MAKE headers_check KBUILD_SRC=
>>> -    $MAKE headers_install KBUILD_SRC=
>>> INSTALL_HDR_PATH="$libc_headers_dir/usr"
>>> -fi
>>> -
>>>  # Install the maintainer scripts
>>>  # Note: hook scripts under /etc/kernel are also executed by official
>>> Debian
>>>  # kernel packages, as well as kernel packages built using make-kpkg.
>>> @@ -323,6 +318,32 @@ EOF
>>>
>>>  fi
>>>
>>> +# Do we have firmware? Move it out of the way and build it into a
>>> package.
>>
>>
>> This comment is no longer accurate as we split the move and the build.
>>
>>> +if [ -e "$tmpdir/lib/firmware" ]; then
>>> +    mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
>>> +    rmdir "$tmpdir/lib/firmware"
>>> +fi
>>> +
>>> +create_package "$packagename" "$tmpdir"
>>> +[ "x$1" = "xfastdeb-pkg" ] && exit 0
>>
>>
>> How idiomatic is [ condition ] && command vs if [ condition ]; then
>> command; fi? Perhaps it's just my lack of bash-fu but this took me a
>> moment to parse.
>>
>>> +
>>> +if [ -e "$fwdir/lib/firmware/$version" ]; then
>>> +    cat <<EOF >> debian/control
>>> +
>>> +Package: $fwpackagename
>>> +Architecture: all
>>> +Description: Linux kernel firmware, version $version
>>> + This package contains firmware from the Linux kernel, version $version.
>>> +EOF
>>> +
>>> +    create_package "$fwpackagename" "$fwdir"
>>> +fi
>>> +
>>> +if [ "$ARCH" != "um" ]; then
>>> +    $MAKE headers_check KBUILD_SRC=
>>> +    $MAKE headers_install KBUILD_SRC=
>>> INSTALL_HDR_PATH="$libc_headers_dir/usr"
>>> +fi
>>> +
>>>  # Build kernel header package
>>>  (cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name
>>> \*.pl) > "$objtree/debian/hdrsrcfiles"
>>>  (cd $srctree; find arch/*/include include scripts -type f) >>
>>> "$objtree/debian/hdrsrcfiles"
>>> @@ -354,22 +375,6 @@ Description: Linux kernel headers for
>>> $KERNELRELEASE on \${kernel:debarch}
>>>   This is useful for people who need to build external modules
>>>  EOF
>>>
>>> -# Do we have firmware? Move it out of the way and build it into a
>>> package.
>>> -if [ -e "$tmpdir/lib/firmware" ]; then
>>> -    mv "$tmpdir/lib/firmware"/* "$fwdir/lib/firmware/$version/"
>>> -    rmdir "$tmpdir/lib/firmware"
>>> -
>>> -    cat <<EOF >> debian/control
>>> -
>>> -Package: $fwpackagename
>>> -Architecture: all
>>> -Description: Linux kernel firmware, version $version
>>> - This package contains firmware from the Linux kernel, version $version.
>>> -EOF
>>> -
>>> -    create_package "$fwpackagename" "$fwdir"
>>> -fi
>>> -
>>>  cat <<EOF >> debian/control
>>>
>>>  Package: $libc_headers_packagename
>>> @@ -386,8 +391,6 @@ if [ "$ARCH" != "um" ]; then
>>>      create_package "$libc_headers_packagename" "$libc_headers_dir"
>>>  fi
>>>
>>> -create_package "$packagename" "$tmpdir"
>>> -
>>>  if [ -n "$BUILD_DEBUG" ] ; then
>>>      # Build debug package
>>>      # Different tools want the image in different locations
>>>
>>
>
> --
> Andrew Donnellan              OzLabs, ADL Canberra
> andrew.donnellan@au1.ibm.com  IBM Australia Limited
>
