#!/bin/bash
#set -x

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${1:-2remove}
TARGET_DIR=${1:-bakap}

if [[ ! -d $TARGET_DIR ]] ; then 

    mkdir "$TARGET_DIR"
fi

for item in $(cat ${RM_LIST}) ; do
    rm -rf "${SOURCE_DIR}/${item}"
done

for file in ${SOURCE_DIR}/* ; do
    if [[  -d ${file} ]] ; then
        cp -r "${file}" "${TARGET_DIR}/$(basename ${file})"
    else
        mv "${file}" "${TARGET_DIR}/$(basename ${file})"
    fi
done

REMAINING=0

for file in ${SOURCE_DIR}/* ; do
    REMAINING=$((REMAINING + 1))
done

if [[ ${REMAINING} -eq 0 ]] ; then
    echo "tu był Kononowicz"
fi

if [[ ${REMAINING} -ge 2 ]] ; then
    echo "zostały co najmniej 2 pliki"
    if [[ ${REMAINING} -lt 4 ]] ; then
        echo "też coś piszemy"
    fi
fi

if [[ ${REMAINING} -gt 4 ]] ; then
    echo "zostało więcej niż 4 pliki"
fi

zip -r "bakap_$(date -I).zip" "${TARGET_DIR}"

